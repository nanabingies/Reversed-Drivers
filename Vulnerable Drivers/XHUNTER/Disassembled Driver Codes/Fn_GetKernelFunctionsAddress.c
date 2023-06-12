

auto Fn_GetKernelFunctionsAddress() -> NTSTATUS {
	UNICODE_STRING usString = { 0 };

	RtlInitUnicodeString(&usString, L"ObGetFilterVersion");
	kernelUtils::_ObGetFilterVersion = reinterpret_cast<pObGetFilterVersion>(MmGetSystemRoutineAddress(&usString));

	RtlInitUnicodeString(&usString, L"ObRegisterCallbacks");
	kernelUtils::_ObRegisterCallbacks = reinterpret_cast<pObRegisterCallbacks>(MmGetSystemRoutineAddress(&usString));

	RtlInitUnicodeString(&usString, L"ObUnRegisterCallbacks");
	kernelUtils::_ObUnRegisterCallbacks = reinterpret_cast<pObUnRegisterCallbacks>
		(MmGetSystemRoutineAddress(&usString));

	RtlInitUnicodeString(&usString, L"ExfAcquirePushLockExclusive");
	kernelUtils::_ExfAcquirePushLockExclusive = reinterpret_cast<pExfAcquirePushLockExclusive>
		(MmGetSystemRoutineAddress(&usString));

	RtlInitUnicodeString(&usString, L"ExfReleasePushLockExclusive");
	kernelUtils::_ExfReleasePushLockExclusive = reinterpret_cast<pExfReleasePushLockExclusive>
		(MmGetSystemRoutineAddress(&usString));

	return STATUS_SUCCESS;
}