#include <ntddk.h>

EXTERN_C NTSTATUS DriverEntry(_In_ PDRIVER_OBJECT DriverObject, _In_ PUNICODE_STRING) {
	UNICODE_STRING usDriver{};
	UNICODE_STRING usDosDriver{};
	PDEVICE_OBJECT devObj{};

	RtlInitUnicodeString(&usDriver, L"\\Device\\genericdrv");
	
	NTSTATUS status = IoCreateDevice(DriverObject, 0x20, &usDriver, 0xFA00, 0, FALSE, &devObj);
	if (!NT_SUCCESS(status))
		return status;

	RtlInitUnicodeString(&usDosDriver, L"\\??\\genericdrv");
	status = IoCreateSymbolicLink(&usDosDriver, &usDriver);
	if (!NT_SUCCESS(status)) {
		IoDeleteDevice(devObj);
		return status;
	}

	DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = IOCTL;
	DriverObject->MajorFunction[IRP_MJ_WRITE] = IOCTL;
	DriverObject->MajorFunction[IRP_MJ_READ] = IOCTL;
	DriverObject->MajorFunction[IRP_MJ_CLOSE] = IOCTL;
	DriverObject->MajorFunction[IRP_MJ_CREATE] = IOCTL;

	DriverObject->DriverUnload = DriverUnload;

	PVOID devExt = *(PVOID*)(devObj->DeviceExtension);
	RtlZeroMemory(devExt, 0x20);

	return status;
}