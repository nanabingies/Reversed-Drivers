
struct _devExt {
	ULONG64			a1;		// 0x00
	PDEVICE_OBJECT	a2;		// 0x08
};

EXTERN_C NTSTATUS DriverEntry(_In_ PDRIVER_OBJECT DriverObject, _In_ PUNICODE_STRING) {
	UNICODE_STRING usDrv = RTL_CONSTANT_STRING(L"\\Device\\ASMMAP64");
	PDEVICE_OBJECT a1;
	struct _devExt* devExt;
	NTSTATUS status;

	DriverObject->MajorFunction[IRP_MJ_CREATE] = Fn_DefaultIoctl;
	DriverObject->MajorFunction[IRP_MJ_CLOSE] = Fn_DefaultIoctl;
	DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = Fn_DefaultIoctl;

	DriverObject->DriverUnload = Fn_DriverUnload;
	status = Fn_CreateDevice(&usDrv, 0x9C40, DriverObject, &a1);
	if (!NT_SUCCESS(status)){
		return status;
	}

	devExt = (struct _devExt*)(a1->DeviceExtension);
	devExt->a2 = a1;
	devExt->a1 = 0x9C40;

	return status;
}