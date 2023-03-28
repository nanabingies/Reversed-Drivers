
struct _devExt {
	ULONG64			a1;		// 0x00
	PDEVICE_OBJECT	a2;		// 0x08
};

NTSTATUS Fn_Ummapmem(struct _devExt* devExt, PIRP Irp, PIO_STACK_LOCATION stackLocation) {
	PVOID systemBuffer;
	ULONG inBufLength;
	NTSTATUS status = STATUS_INSUFFICIENT_RESOURCES;

	inBufLength = stackLocation->Parameters.DeviceIoControl.InputBufferLength;
	Irp->IoStatus.Information = 0;
	systemBuffer = Irp->AssociatedIrp.SystemBuffer;
	if (inBufLength == 0x18) {
		DbgPrint("(UMMAPMEM) Unmap Addr %I64x [%x,%x]", *(unsigned long long*)((ULONG_PTR)systemBuffer + 0x8), 
			*(ULONG*)((ULONG_PTR)systemBuffer + 0xC), *(ULONG*)((ULONG_PTR)systemBuffer + 0x8));
		status = ZwUnmapViewOfSection(PsGetCurrentProcessId(), *(PVOID*)((ULONG_PTR)systemBuffer + 0x8));
	}
	else {
		DbgPrint("(UMMAPMEM) Insufficient input or output buffer");
	}

	return status;
}