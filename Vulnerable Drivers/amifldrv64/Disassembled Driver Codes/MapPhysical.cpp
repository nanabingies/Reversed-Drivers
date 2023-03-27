
struct _v2 {
	PVOID a1;		// 0x00
	ULONG a2;		// 0x08
	ULONG a3;		// 0x0C
	ULONG a4;		// 0x10
	PVOID a5;		// 0x18
};

NTSTATUS MapPhysical(PVOID systemBuffer) {
	PVOID a1;
	PVOID sectionObject, baseAddress;
	ULONG a2, a3, addressSpace;
	UNICODE_STRING usPhys{};
	OBJECT_ATTRIBUTES oa{};
	PHYSICAL_ADDRESS busAddress, translatedAddress;
	LARGE_INTEGER sectionOffset;
	NTSTATUS status;
	BOOLEAN pass1, pass2;
	SIZE_T viewSize;
	struct _v2* v2 = (struct _v2*)systemBuffer;

	a3 = v2->a3;
	a2 = v2->a2;
	a1 = v2->a1;	// SectionHandle passed in from UM

	RtlInitUnicodeString(&usPhys, L"\\Device\\PhysicalMemory");
	InitializeObjectAttributes(&oa, NULL, OBJ_KERNEL_HANDLE | OBJ_CASE_INSENSITIVE, NULL, NULL);
	status = ZwOpenSection((PHANDLE)a1, 0xF001F, &oa);
	if (!NT_SUCCESS(status)) {
		ZwClose(*(HANDLE*)a1);
		return status;
	}

	status = ObReferenceObjectByHandle(*(HANDLE*)a1, 0xF001F, NULL, KernelMode, &sectionObject, NULL);
	if (!NT_SUCCESS(status)) {
		ZwClose(*(HANDLE*)a1);
		return status;
	}

	busAddress.QuadPart = a3;
	addressSpace = 0;
	pass1 = HalTranslateBusAddress(Isa, 0, busAddress, &addressSpace, &translatedAddress);
	busAddress.QuadPart = a3 + a2;
	pass2 = HalTranslateBusAddress(Isa, 0, busAddress, &addressSpace, &busAddress);
	if (pass1 == false || pass2 == false) {
		return status;
	}

	ULONG size = busAddress.QuadPart - translatedAddress.QuadPart;
	if (size == 0) {
		return status;
	}

	sectionOffset.QuadPart = translatedAddress.QuadPart;
	viewSize = size;
	status = ZwMapViewOfSection(*(HANDLE*)a1, PsGetCurrentProcessId(), &baseAddress, 0, size,
		&sectionOffset, &viewSize, ViewShare, 0, 0x204);
	if (!NT_SUCCESS(status)) {
		ZwClose(*(HANDLE*)a1);
		return status;
	}

	baseAddress = (PVOID)((LONGLONG)baseAddress + translatedAddress.QuadPart);
	v2->a1 = baseAddress;

	return status;
}