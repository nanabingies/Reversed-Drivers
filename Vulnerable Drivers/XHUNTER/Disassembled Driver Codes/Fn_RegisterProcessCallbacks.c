

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


auto Fn_GetOsVersion() -> NTSTATUS {
		ULONG dwBuildNumber, dwMinorVersion, dwMajorVersion;
		NTSTATUS ntStatus = STATUS_UNSUCCESSFUL;

		auto defaultOsVals = [&](OsVersionInfoStruct _OsStruct) -> void {
			_OsStruct.param0 = &sub_140004780;
			_OsStruct.param1 = &sub_14000465C;
			_OsStruct.param2 = &sub_140004604;
			_OsStruct.param3 = &sub_140004614;
			_OsStruct.param4 = &sub_14000472C;
			_OsStruct.param5 = &sub_140004620;
			_OsStruct.param6 = &sub_1400046EC;
			_OsStruct.param7 = &sub_14000454C;
		};

		
		PsGetVersion(&dwMajorVersion, &dwMinorVersion, &dwBuildNumber, nullptr);
		if (dwMajorVersion == 10) {		/// Windows 10 & above
			if (dwMinorVersion == 0) {
				if (dwBuildNumber >= 0x295A) {
					defaultOsVals(_OsStruct);

					if (dwBuildNumber > 0x3839)		os_check_num = 0xB;
					else							os_check_num = 0xA;
					ntStatus = STATUS_SUCCESS;
					goto _end;
				}
				else {				/// dwBuildNumber < 0x295A
					os_check_num = 0x9;
					defaultOsVals(_OsStruct);

					ntStatus = STATUS_SUCCESS;
					goto _end;
				}
			}
			else {
				os_check_num = 0x0;
				ntStatus = STATUS_UNSUCCESSFUL;
				goto _end;
			}
		}

		else if (dwMajorVersion == 6) {		/// Windows Vista -- Windows 8.1
			if (dwMinorVersion == 3) {		/// Windows 8.1 or Windows Server
				os_check_num = 0x8;
				defaultOsVals(_OsStruct);

				ntStatus = STATUS_SUCCESS;
				goto _end;
			}

			else if (dwMinorVersion == 2) {			/// Windows Server 2012 or Windows 8
				os_check_num = 0x7;
				defaultOsVals(_OsStruct);

				ntStatus = STATUS_SUCCESS;
				goto _end;
			}

			else if (dwMinorVersion == 1) {			/// Windows Server 2008 R2 or Windows 7
				os_check_num = 0x6;
				_OsStruct.param0 = &sub_1400046E4;
				_OsStruct.param1 = &sub_140004760;
				_OsStruct.param2 = &sub_140004604;
				_OsStruct.param3 = &sub_140004614;
				_OsStruct.param4 = &sub_14000472C;
				_OsStruct.param5 = &IoGetCurrentIrpStackLocation;
				_OsStruct.param6 = &sub_1400046EC;
				_OsStruct.param7 = &sub_140004770;

				ntStatus = STATUS_SUCCESS;
				goto _end;
			}

			else if (dwMinorVersion == 0) {			/// Windows Vista or Windows Server 2008
				os_check_num = 0x4;
				_OsStruct.param0 = &sub_14000464C;
				_OsStruct.param1 = &sub_140004760;
				_OsStruct.param2 = &sub_140004604;
				_OsStruct.param3 = &sub_140004614;
				_OsStruct.param4 = &sub_14000472C;
				_OsStruct.param5 = &byte_1400045D4;
				_OsStruct.param6 = &sub_140004628;
				_OsStruct.param7 = &off_140007258;
				
				ntStatus = STATUS_SUCCESS;
				goto _end;
			}

			else {
				os_check_num = 0x0;
				ntStatus = STATUS_UNSUCCESSFUL;
				goto _end;
			}
		}

		else if (dwMajorVersion == 5) {			/// Windows 2000 -- WIndows Home Server
			if (dwMinorVersion == 2) {			/// Windows XP x64 or Windows Server 2003 or Windows Home Server
				os_check_num = 0x3;
				_OsStruct.param0 = &sub_14000457C;
				_OsStruct.param1 = &sub_140004760;
				_OsStruct.param2 = &sub_140004604;
				_OsStruct.param3 = &sub_140004614;
				_OsStruct.param4 = &sub_1400045C4;
				_OsStruct.param5 = &byte_1400045D4;
				_OsStruct.param6 = &sub_140004628;
				_OsStruct.param7 = &sub_140004640;

				ntStatus = STATUS_SUCCESS;
				goto _end;
			}

			else {
				os_check_num = 0x0;
				ntStatus = STATUS_UNSUCCESSFUL;
				goto _end;
			}
		}

		else {
			os_check_num = 0x0;
			ntStatus = STATUS_UNSUCCESSFUL;
		}

	_end:
		return ntStatus;
	}