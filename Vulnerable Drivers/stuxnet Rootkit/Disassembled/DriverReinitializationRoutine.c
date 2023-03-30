
VOID DriverReinitializationRoutine(_In_ PDRIVER_OBJECT DriverObject, _In_opt_ PVOID Context, _In_ ULONG Count) {
	KIRQL irql;

	irql = KeGetCurrentIrql();
	if (irql != PASSIVE_LEVEL || Count > 0x65) {
		return;
	}

	if (sub_10580() != 0x0)	return;
	if (GetHaldllHandle() == FALSE) {
		IoRegisterDriverReinitialization(DriverObject, DriverReinitializationRoutine, NULL);
		return;
	}

	RegisterImageCallback();
	return;
}