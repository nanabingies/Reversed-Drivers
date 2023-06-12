
VOID Fn_DriverUnload(_In_ PDRIVER_OBJECT DriverObject) {
	Fn_RemoveProcessCallbacks();
	IoDeleteSymbolicLink(&xmmword_14000A500);
	sub_14000429C(&xmmword_14000A4F0);
	sub_14000429C(&xmmword_14000A500);
	IoDeleteDevice(DriverObject->DeviceObject);

	return;
}