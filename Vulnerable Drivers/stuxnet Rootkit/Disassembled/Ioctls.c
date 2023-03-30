
NTSTATUS DefaultIoctl(_In_ PDEVICE_OBJECT DeviceObject, _In_ PIRP Irp) {
	Irp->IoStatus.Status = STATUS_SUCCESS;
	Irp->IoStatus.Information = 0;
	IofCompleteRequest(Irp, IO_NO_INCREMENT);
	return STATUS_SUCCESS;
}


NTSTATUS IoctlDispatch(_In_ PDEVICE_OBJECT DeviceObject, _In_ PIRP Irp) {
	NTSTATUS status = STATUS_NOT_IMPLEMENTED;
	PIO_STACK_LOCATION ioStack;
	ULONG ioctlCode;

	ioStack = IoGetCurrentIrpStackLocation(Irp);
	ioctlCode = ioStack->Parameters.DeviceIoControl.IoControlCode;
	if (ioctlCode == 0x223800) {
		status = sub_11A48(Irp);
	}
	
	Irp->IoStatus.Information = 0;
	Irp->IoStatus.Status = status;
	IofCompleteRequest(Irp, IO_NO_INCREMENT);

	return status;
}