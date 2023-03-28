
EXTERN_C NTSTATUS DriverEntry(_In_ PDRIVER_OBJECT DriverObject, _In_ PUNICODE_STRING) {
	UNICODE_STRING usDrv = RTL_CONSTANT_STRING(L"\\Device\\ASMMAP64");
	PVOID a1, a2;
	NTSTATUS status;

	DriverObject->MajorFunction[IRP_MJ_CREATE] = DefaultIoctl;
	DriverObject->MajorFunction[IRP_MJ_CLOSE] = DefaultIoctl;
	DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = DefaultIoctl;

	DriverObject->DriverUnload = DriverUnload;
	status = Fn_CreateDevice(&usDrv, 0x9C40, DriverObject, &a1);
	if (!NT_SUCCESS(status)){
		return status;
	}

	a2 = *(PVOID*)((ULONG_PTR)a1 + 0x40);
	*(PVOID*)((ULONG_PTR)a2 + 0x8) = a1;
	*(ULONG*)((ULONG_PTR)a2) = 0x9C40;

	return status;
}