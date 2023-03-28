
struct _devExt {
	ULONG64			a1;		// 0x00
	PDEVICE_OBJECT	a2;		// 0x08
};

EXTERN_C NTSTATUS Fn_DefaultIoctl(_In_ PDEVICE_OBJECT DeviceObject, _In_ PIRP Irp) {
	PIO_STACK_LOCATION stackLocation;
	struct _devExt* devExt;
	ULONG mjFunc, ioctlCode;
	NTSTATUS status = STATUS_NOT_IMPLEMENTED;

	Irp->IoStatus.Information = 0;
	stackLocation = IoGetCurrentIrpStackLocation(Irp);
	devExt = (struct _devExt*)DeviceObject->DeviceExtension;
	mjFunc = stackLocation->MajorFunction;

	if ((mjFunc & 0xFD) == 0) {
		status = STATUS_SUCCESS;
	}
	else if (mjFunc == 0x0E) {
		ioctlCode = stackLocation->Parameters.DeviceIoControl.IoControlCode;
		switch (ioctlCode) {
		case 0x9C402580:
			status = Fn_MapmemPhysical(devExt, Irp, stackLocation);
			break;

		case 0x9C402584:
			status = Fn_Ummapmem(devExt, Irp);
			break;

		default:
			status = STATUS_INVALID_PARAMETER;
			break;
		}
		
	}

	Irp->IoStatus.Status = status;
	IofCompleteRequest(Irp, IO_NO_INCREMENT);
	return status;
}