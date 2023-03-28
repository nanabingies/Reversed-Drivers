#pragma comment(lib, "Wdmsec.lib")

struct _devExt {
	ULONG64			a1;		// 0x00
	DEVICE_OBJECT	a2;		// 0x08
};

NTSTATUS Fn_CreateDevice(PUNICODE_STRING usDrv, ULONG cons, PDRIVER_OBJECT DriverObject, PDEVICE_OBJECT* devObj) {
	UNICODE_STRING usDos;
	struct _devExt* devExt;
	NTSTATUS status;

	RtlInitUnicodeString(&usDos, L"D:P(A;;GA;;;SY)(A;;GRGWGX;;;BA)");
	status = WdmlibIoCreateDeviceSecure(DriverObject, 0x10, usDrv, 0x9C40, 0, FALSE, &usDos, NULL, devObj);
	if (!NT_SUCCESS(status)) {
		return status;
	}

	devExt = (struct _devExt*)*(PVOID*)((*devObj)->DeviceExtension);
	RtlZeroMemory(devExt, 0x10);
	RtlInitUnicodeString(&usDos, L"\\DosDevices\\ASMMAP64");
	status = IoCreateSymbolicLink(&usDos, usDrv);
	if (!NT_SUCCESS(status)) {
		IoDeleteDevice((*devObj));
	}

	return status;
}