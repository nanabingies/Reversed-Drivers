

EXTERN_C NTSTATUS DriverEntry(_In_ PDRIVER_OBJECT DriverObject, _In_ PUNICODE_STRING RegistryPath) {

	PDEVICE_OBJECT DeviceObject{};
	UNICODE_STRING var_30{}, device_name{}, dos_device_name{};
	NTSTATUS ntstatus;

	if (RegistryPath->Length == 0) {
		return STATUS_UNSUCCESSFUL;
	}

	if (!NT_SUCCESS(sub_140004234(&var_30, RegistryPath))) {
		return STATUS_UNSUCCESSFUL;
	}

	if (!NT_SUCCESS(sub_14000366C(&dos_device_name, &var_30))) {
		sub_14000429C(&var_30);
		return STATUS_UNSUCCESSFUL;
	}

	if (!NT_SUCCESS(sub_1400035CC(&var_30, &device_name))) {
		sub_14000429C(&var_30);
		sub_14000429C(&dos_device_name);
		return STATUS_UNSUCCESSFUL;
	}

	ntstatus = IoCreateDevice(DriverObject, 0, &device_name, FILE_DEVICE_UNKNOWN, 0, FALSE, &DeviceObject);
	
	DriverObject->DriverUnload = Fn_DriverUnload;
	DriverObject->MajorFunction[IRP_MJ_CREATE] = Fn_IRP_MJ_CREATE;
	DriverObject->MajorFunction[IRP_MJ_CLOSE]  = Fn_IRP_MJ_CLOSE;
	DriverObject->MajorFunction[IRP_MJ_WRITE]  = Fn_IRP_MJ_WRITE;

	if (!NT_SUCCESS(ntstatus)) {
		sub_14000429C(&var_30);
		sub_14000429C(&device_name);
		sub_14000429C(&dos_device_name);
		return ntstatus;
	}

	DeviceObject->Flags |= DO_BUFFERED_IO;
	xmmword_14000A4F0 = var_30;
	xmmword_14000A500 = dos_device_name;

	Fn_SetupCallbackStructure();
	ntstatus = Fn_RegisterProcessCallbacks(DriverObject);
	if (!NT_SUCCESS(ntstatus)) {
		IoDeleteDevice(DeviceObject);
		sub_14000429C(&device_name);
		return ntstatus;
	}

	ntstatus = Fn_GetKernelFunctionsAddress();
	if (!NT_SUCCESS(ntstatus)) {
		sub_140003238();
		IoDeleteDevice(DeviceObject);
		sub_14000429C(&device_name);
		return ntstatus;
	}

	ntstatus = IoCreateSymbolicLink(&dos_device_name, &device_name);
	if (!NT_SUCCESS(ntstatus)) {
		sub_140003238();
		IoDeleteDevice(DeviceObject);
		sub_14000429C(&device_name);
		return ntstatus;
	}

end:
	sub_14000429C(&device_name);
	return STATUS_SUCCESS;
}
