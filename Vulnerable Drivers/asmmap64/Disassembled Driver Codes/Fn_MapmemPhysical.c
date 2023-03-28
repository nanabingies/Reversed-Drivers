
struct _devExt {
	ULONG64			a1;		// 0x00
	PDEVICE_OBJECT	a2;		// 0x08
};

struct _v2 {
	ULONG			a1;		// 0x00
	ULONG			a2;		// 0x04
	ULONG64			a3;		// 0x08
	ULONG			a4;		// 0x10
};

NTSTATUS FnMapmemPhysical(struct _devExt* devExt, PIRP Irp, PIO_STACK_LOCATION stackLocation) {
	PVOID systemBuffer, secObject, baseAddress;
	ULONG inBufLength, outBufLength, addressSpace, addressSpace2;
	UNICODE_STRING usString;
	PHYSICAL_ADDRESS busAddress, endBusAddress, translatedAddress;
	LARGE_INTEGER sectionOffset;
	HANDLE secHandle = 0;
	OBJECT_ATTRIBUTES oa;
	BOOLEAN pass1, pass2;
	NTSTATUS status;

	inBufLength = stackLocation->Parameters.DeviceIoControl.InputBufferLength;
	outBufLength = stackLocation->Parameters.DeviceIoControl.OutputBufferLength;
	Irp->IoStatus.Information = 0;
	systemBuffer = Irp->AssociatedIrp.SystemBuffer;
	if (inBufLength < 0x18 || outBufLength < 0x18) {
		DbgPrint("(MAPMEM) Buffer size error\n");
		status = STATUS_INSUFFICIENT_RESOURCES;
		return status;
	}

	addressSpace = 0;
	addressSpace2 = 0;
	struct _v2* v2 = (struct _v2*)systemBuffer;
	RtlInitUnicodeString(&usString, L"\\Device\\PhysicalMemory");
	busAddress.LowPart = v2->a1;
	busAddress.HighPart = v2->a2;
	InitializeObjectAttributes(&oa, &usString, OBJ_CASE_INSENSITIVE, 0, NULL);
	status = ZwOpenSection(&secHandle, SECTION_ALL_ACCESS, &oa);
	status = ObReferenceObjectByHandle(secHandle, SECTION_ALL_ACCESS, NULL, KernelMode, &secObject, NULL);
	if (!NT_SUCCESS(status)) {
		DbgPrint("(MAPMEM) ObReferenceObjectByHandle failed\n");
		ZwClose(secHandle);
		return status;
	}

	endBusAddress.QuadPart = busAddress.QuadPart + v2->a4;
	pass1 = HalTranslateBusAddress(Isa, 0, busAddress, &addressSpace, &translatedAddress);
	pass2 = HalTranslateBusAddress(Isa, 0, endBusAddress, &addressSpace2, &endBusAddress);
	if (pass1 == false || pass2 == false) {
		DbgPrint("(MAPMEM) HalTranslatephysicalAddress failed\n");
		ZwClose(secHandle);
		return STATUS_SUCCESS;
	}

	DbgPrint("(MAPMEM) physicalAddressbase=%8.8x %8.8x\n", translatedAddress.LowPart, translatedAddress.HighPart);
	DbgPrint("(MAPMEM) physicalAddressend=%8.8x %8.8x\n", endBusAddress.LowPart, endBusAddress.HighPart);

	endBusAddress.QuadPart -= translatedAddress.QuadPart;
	if (endBusAddress.LowPart == 0x0) {
		DbgPrint("(MAPMEM) mappedLength.LowPart == 0\n");
		ZwClose(secHandle);
		return STATUS_SUCCESS;
	}

	if (addressSpace == 0x0) {
		DbgPrint("viewBase:%x %x\n", (translatedAddress.LowPart >> 0x20), translatedAddress.LowPart);
		baseAddress = 0;
		SIZE_T commitSize = endBusAddress.QuadPart;
		sectionOffset.QuadPart = translatedAddress.QuadPart;
		status = ZwMapViewOfSection(secHandle, PsGetCurrentProcessId(), &baseAddress, NULL, commitSize, &sectionOffset,
			&commitSize, ViewShare, 0, PAGE_NOCACHE | PAGE_READWRITE);
		if (!NT_SUCCESS(status)) {
			DbgPrint("(MAPMEM) ZwMapViewOfSection failed:%x\n", status);
			ZwClose(secHandle);
			return STATUS_SUCCESS;
		}

		DbgPrint("(MAPMEM) physicalMemoryHandle=%x\n", HandleToULong(secHandle));
		translatedAddress.QuadPart += sectionOffset.QuadPart;
		baseAddress = (PVOID)((ULONG_PTR)baseAddress + translatedAddress.QuadPart);
		DbgPrint("(MAPMEM) virtualAddress=%x %x\n", ((ULONG)baseAddress >> 0x20), (ULONG)baseAddress);
		v2->a4 = (ULONG)baseAddress >> 0x20;
		v2->a3 = (ULONG64)baseAddress;
	}
	else {
		DbgPrint("inIoSpace = 1\n");
		v2->a3 = translatedAddress.LowPart;
		v2->a4 = translatedAddress.HighPart;
	}

	DbgPrint("(MAPMEM) memory successfully mapped\n");
	Irp->IoStatus.Information = 0x18;
	ZwClose(secHandle);
	return STATUS_SUCCESS;
}