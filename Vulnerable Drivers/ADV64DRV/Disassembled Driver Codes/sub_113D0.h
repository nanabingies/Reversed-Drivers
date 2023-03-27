#pragma once
#include <wdm.h>

VOID sub_113D0(PDRIVER_OBJECT DriverObject) {

	UNICODE_STRING DosDeviceName;
	RtlInitUnicodeString(&DosDeviceName, L"\\DosDevices\\ADV64DRV");
	IoDeleteSymbolicLink(&DosDeviceName);
	IoDeleteDevice(DriverObject->DeviceObject);
}
