
__int64 __fastcall IOCTL(_In_ PDEVICE_OBJECT DeviceObject,_In_ PIRP Irp)
{
    PVOID devExt;
    PIO_STACK_LOCATION ioStack;
    ULONG ioctlCode, inBufLength, outBufLength;
    PVOID systemBuffer;
    unsigned int v10 = 0;
    NTSTATUS status = STATUS_SUCCESS;

    devExt = *(PVOID*)(DeviceObject->DeviceExtension);
    ioStack = IoGetCurrentIrpStackLocation(Irp);
    Irp->IoStatus.Status = STATUS_SUCCESS;
    Irp->IoStatus.Information = 0;

    if (ioStack->MajorFunction == 0x0E) {   // IRP_MJ_DEVICE_CONTROL 
        ioctlCode = ioStack->Parameters.DeviceIoControl.IoControlCode;
        inBufLength = ioStack->Parameters.DeviceIoControl.InputBufferLength;
        outBufLength = ioStack->Parameters.DeviceIoControl.OutputBufferLength;
        systemBuffer = *(PVOID*)(Irp->AssociatedIrp.SystemBuffer);
        status = DeviceIoControl(ioctlCode, systemBuffer, inBufLength, systemBuffer, outBufLength,
            &v10, devExt);
        Irp->IoStatus.Information = v10;
    }

    IoCompleteRequest(Irp, IO_NO_INCREMENT);
    return status;
}