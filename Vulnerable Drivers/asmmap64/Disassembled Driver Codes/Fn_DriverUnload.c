
struct _devExt {
	ULONG64			a1;		// 0x00
	PDEVICE_OBJECT	a2;		// 0x08
};

EXTERN_C VOID DRiverUnload(_In_ PDRIVER_OBJECT DriverObject) {
	UNICODE_STRING usDos = RTL_CONSTANT_STRING(L"\\DosDevices\\ASMMAP64");
	IoDeleteSymbolicLink(&usDos);

	struct _devExt* devExt = (struct _devExt*)DriverObject->DeviceObject->DeviceExtension;
	IoDeleteDevice(devExt->a2);

	return;
}