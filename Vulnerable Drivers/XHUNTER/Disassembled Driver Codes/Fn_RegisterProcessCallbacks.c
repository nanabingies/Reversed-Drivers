

auto Fn_RegisterProcessCallbacks(_In_ PDRIVER_OBJECT) -> NTSTATUS {

	NTSTATUS ntStatus;
	UNICODE_STRING uStringPsSetCreateProcessNotifyRoutineEx{};

	Utils::dword_14000A498 = 0x0;
	Utils::dword_14000A49C = 0x0;

	KeInitializeMutex(static_cast<PRKMUTEX>(&CallbackUtils::g_mutex), 0);
	CallbackUtils::g_PoolHandle = ExAllocatePoolWithTag(NonPagedPool, 0x2000i64, 'xhz1');
	if (CallbackUtils::g_PoolHandle == nullptr) {
		return STATUS_INSUFFICIENT_RESOURCES;
	}
	CallbackUtils::g_PoolHandle = 0x0;
	CallbackUtils::qword_14000A488 = 0x0;
	CallbackUtils::qword_14000A490 = PAGE_SIZE;

	ntStatus = Utils::Fn_GetOsVersion();
	if (!NT_SUCCESS(ntStatus)) {
		return ntStatus;
	}

	CallbackUtils::Fn_MemsetGlobalVariables();		// memsets some structures to 0
	CallbackUtils::Fn_LookasideList();				// memsets a struct, initializes it & calls initializeNPagedlookasidelist

	CallbackUtils::var_0 = 0;
	CallbackUtils::var_1 = 0;

	RtlInitUnicodeString(&uStringPsSetCreateProcessNotifyRoutineEx, L"PsSetCreateProcessNotifyRoutineEx");
	CallbackUtils::_PsSetCreateProcessNotifyRoutineEx = reinterpret_cast<pPsSetCreateProcessNotifyRoutineEx>
		(MmGetSystemRoutineAddress(&uStringPsSetCreateProcessNotifyRoutineEx));
	if (CallbackUtils::_PsSetCreateProcessNotifyRoutineEx != nullptr) {
		ntStatus = CallbackUtils::_PsSetCreateProcessNotifyRoutineEx(
			static_cast<PCREATE_PROCESS_NOTIFY_ROUTINE_EX>(&CallbackUtils::PcreateProcessNotifyRoutineEx), false
		);
		
		if (NT_SUCCESS(ntStatus))	CallbackUtils::var_0 = true;
		else						CallbackUtils::var_0 = false;
	}
	else {
		CallbackUtils::var_0 = false;
	}

	CallbackUtils::var_1 = true;
	if (CallbackUtils::var_0 == false) {
		ntStatus = PsSetCreateProcessNotifyRoutine(
			static_cast<PCREATE_PROCESS_NOTIFY_ROUTINE>(&CallbackUtils::PcreateProcessNotifyRoutine), false
		);

		if (NT_SUCCESS(ntStatus))		CallbackUtils::var_1 = true;
		else							CallbackUtils::var_1 = false;
	}

	if (ntStatus != STATUS_SUCCESS) {
		goto loc_1400033AC;
	}

	ntStatus = CallbackUtils::Fn_ObRegistersCallbackRoutines();
	if (!NT_SUCCESS(ntStatus)) {
		return STATUS_SUCCESS;
	}

	if (CallbackUtils::var_1 == false) {
		goto loc_1400033AC;
	}

	PsSetCreateProcessNotifyRoutine(
		static_cast<PCREATE_PROCESS_NOTIFY_ROUTINE>(&CallbackUtils::PcreateProcessNotifyRoutine), true
			);

loc_1400033AC:
	CallbackUtils::Fn_FreeLookAsideList();

	return ntStatus;
}