

auto Fn_ObUnRegisterCallbacks() -> VOID {
	if (CallbackUtils::RegistrationHandle == nullptr)	return;

	if (CallbackUtils::_ObUnRegisterCallbacks == nullptr)	return;

	CallbackUtils::byte_1400079D8 = 0;
	CallbackUtils::_ObUnRegisterCallbacks(CallbackUtils::RegistrationHandle);
	CallbackUtils::RegistrationHandle = nullptr;

	return;
}


auto Fn_RemoveCallbacks() -> VOID {
	Fn_ObUnRegisterCallbacks();

	if ((CallbackUtils::var_0 == true) && (CallbackUtils::_PsSetCreateProcessNotifyRoutineEx != nullptr)) {
		CallbackUtils::_PsSetCreateProcessNotifyRoutineEx(
			static_cast<PCREATE_PROCESS_NOTIFY_ROUTINE_EX>(&CallbackUtils::PcreateProcessNotifyRoutineEx), true
		);
	}

	if (CallbackUtils::var_1 == true) {
		PsSetCreateProcessNotifyRoutine(
			static_cast<PCREATE_PROCESS_NOTIFY_ROUTINE>(&CallbackUtils::PcreateProcessNotifyRoutine), true
		);
	}

	CallbackUtils::Fn_FreeLookAsideList();

	return;
}