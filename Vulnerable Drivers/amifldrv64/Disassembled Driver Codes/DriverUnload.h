#pragma once
#include <ntddk.h>

EXTERN_C VOID DriverUnload(_In_ PDRIVER_OBJECT DriverObject) {
	UNICODE_STRING usDosDrv{};
	RtlInitUnicodeString(&usDosDrv, L"\\??\\genericdrv");

	IoDeleteSymbolicLink(&usDosDrv);
	IoDeleteDevice(DriverObject->DeviceObject);

	return;
}