
struct _v2 {
	ULONG a1;		// 0x00
	ULONG a2;		// 0x04
	ULONG a3;		// 0x08
	ULONG a4;		// 0x0C
	ULONG a5;		// 0x10
	PVOID a6;		// 0x18
};

using BYTE = unsigned char;
using WORD = unsigned short;

NTSTATUS VulnFunc(PVOID systemBuffer) {
	struct _v2* v2 = (struct _v2*)systemBuffer;
	ULONG a1, a2, a3;
	ULONG addressSpace = 0;
	PVOID systemSpace;
	SIZE_T size;
	PHYSICAL_ADDRESS busAddress, translatedAddress;
	BOOLEAN ret;

	a2 = v2->a2;
	a1 = v2->a1;
	a3 = v2->a3;

	switch (a3) {
	case 0: {
		busAddress.LowPart = a1;
		busAddress.HighPart = 0x0;
		addressSpace = a2;
		size = 1;
		ret = HalTranslateBusAddress(Isa, 0, busAddress, &addressSpace, &translatedAddress);
		if (ret == false)
			return STATUS_BAD_STACK;

		if (addressSpace == 0x0) {
			systemSpace = MmMapIoSpace(translatedAddress, size, MmNonCached);
			v2->a4 = *(BYTE*)(systemSpace);
		}
		else {
			systemSpace = (PVOID)translatedAddress.LowPart;
			USHORT port = *(USHORT*)systemSpace;
			v2->a4 = READ_PORT_USHORT(&port);
		}
	}
		  break;

	case 1: {
		busAddress.LowPart = a1;
		busAddress.HighPart = 0x0;
		size = 2;
		addressSpace = a2;
		ret = HalTranslateBusAddress(Isa, 0, busAddress, &addressSpace, &translatedAddress);
		if (ret == false) {
			return STATUS_BAD_STACK;
		}

		if (addressSpace == 0) {
			systemSpace = MmMapIoSpace(translatedAddress, size, MmNonCached);
			v2->a4 = *(WORD*)systemSpace;
		}
		else {
			systemSpace = (PVOID)translatedAddress.LowPart;
			USHORT port = *(USHORT*)systemSpace;
			v2->a4 = READ_PORT_USHORT(&port);
		}
	}
		  break;

	case 2: {
		busAddress.LowPart = a1;
		busAddress.HighPart = 0;
		size = 4;
		addressSpace = a2;
		ret = HalTranslateBusAddress(Isa, 0, busAddress, &addressSpace, &translatedAddress);
		if (ret == false) {
			return STATUS_BAD_STACK;
		}

		if (addressSpace == 0) {
			systemSpace = MmMapIoSpace(translatedAddress, size, MmNonCached);
			v2->a4 = *(ULONG*)systemSpace;
		}
		else {
			systemSpace = (PVOID)translatedAddress.LowPart;
			USHORT port = *(USHORT*)systemSpace;
			v2->a4 = READ_PORT_USHORT(&port);
		}
	}
		  break;

	default:
		break;
	}

	if (addressSpace == 0x0) {
		MmUnmapIoSpace(systemSpace, size);
	}

	return STATUS_SUCCESS;
}