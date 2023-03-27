#pragma once
#include <wdm.h>
#include "sub_11040.h"

NTSTATUS sub_11460(PDEVICE_OBJECT DeviceObject, PIRP Irp) {
	PIO_STACK_LOCATION StackLocation = IoGetCurrentIrpStackLocation(Irp);
	Irp->IoStatus.Information = 0;
	NTSTATUS rtstatus = STATUS_NOT_IMPLEMENTED;

	if (StackLocation->MajorFunction == 0xE) {
		switch (StackLocation->Parameters.DeviceIoControl.IoControlCode) {
		case 0x224000: {
			rtstatus = STATUS_SUCCESS;
		}
					 break;

		case 0x224004: {
			rtstatus = sub_11040(DeviceObject->DeviceExtension, Irp, StackLocation);
		}
					 break;

		case 0x224010: {
			if (StackLocation->Parameters.DeviceIoControl.OutputBufferLength < 0x4)
				rtstatus = STATUS_BUFFER_TOO_SMALL;
			else {
				rtstatus = STATUS_SUCCESS;
				*(ULONG*)Irp->AssociatedIrp.SystemBuffer = 0x200;
				Irp->IoStatus.Information = 0x4;
			}
		}
					 break;

		}
	}

	Irp->IoStatus.Status = rtstatus;
	IofCompleteRequest(Irp, IO_NO_INCREMENT);
	return rtstatus;
}