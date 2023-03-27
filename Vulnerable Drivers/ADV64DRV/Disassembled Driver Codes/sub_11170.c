#include <wdm.h>
#include "sub_11010.h"
#include "sub_11460.h"
#include "sub_113d0.h"

UNICODE_STRING DriverName = RTL_CONSTANT_STRING(L"\\Device\\ADV64DRV");
UNICODE_STRING DosDeviceName = RTL_CONSTANT_STRING(L"\\DosDevices\\ADV64DRV");

NTSTATUS DriverEntry(PDRIVER_OBJECT DriverObject, PUNICODE_STRING RegistryPath) {
	UNREFERENCED_PARAMETER(RegistryPath);
	NTSTATUS rtStatus;

	rtStatus = IoCreateDevice(DriverObject, 0x18, &DriverName, FILE_DEVICE_UNKNOWN, 0, FALSE, DriverObject->DeviceObject);
	if (NT_SUCCESS(rtStatus)) {
		rtStatus = IoCreateSymbolicLink(&DosDeviceName, &DriverName);
		if (NT_SUCCESS(rtStatus)) {
			DriverObject->DriverUnload = sub_113D0;
			DriverObject->MajorFunction[IRP_MJ_CREATE] = sub_11010;
			DriverObject->MajorFunction[IRP_MJ_CLOSE] = sub_11010;
			DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = sub_11460;

			return STATUS_SUCCESS;
		}

		IoDeleteDevice(DriverObject->DeviceObject);
		DriverObject->DeviceObject = NULL;

		PVOID LogEntry = IoAllocateErrorLogEntry((PVOID)DriverObject, 0x30);
		if (LogEntry) {
			*((PUCHAR)LogEntry + 0x3) = 0xC4F80003;
			*((PUCHAR)LogEntry + 0x6) = 0x0;
			*((PUCHAR)LogEntry + 0x0) = 0x0;
			*((PUCHAR)LogEntry + 0x1) = 0x0;
			*((PUCHAR)LogEntry + 0x4) = 0x5;
			*((PUCHAR)LogEntry + 0x5) = 0x0;
			IoWriteErrorLogEntry((PVOID)LogEntry);
			return rtStatus;
		}
	}

	PVOID LogEntry = IoAllocateErrorLogEntry((PVOID)DriverObject, 0x30);
	if (LogEntry) {
		*((PUCHAR)LogEntry + 0x3) = 0xC4F80002;
		*((PUCHAR)LogEntry + 0x6) = 0x0;
		*((PUCHAR)LogEntry + 0x0) = 0x0;
		*((PUCHAR)LogEntry + 0x1) = 0x0;
		*((PUCHAR)LogEntry + 0x4) = 0x5;
		*((PUCHAR)LogEntry + 0x5) = 0x0;
		IoWriteErrorLogEntry((PVOID)LogEntry);
	}

	return rtStatus;
}
