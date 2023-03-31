
void NotifyRoutine(_In_opt_ PUNICODE_STRING FullImageName, _In_ HANDLE ProcessId, _In_ PIMAGE_INFO ImageInfo) {
	if (KeGetCurrentIrql() > APC_LEVEL)		return;

	if (ProcessId == 0)		return;

	PloadImageNotifyRoutine(FullImageName, ProcessId, ImageInfo);
	return;
}