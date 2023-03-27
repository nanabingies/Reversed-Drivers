
NTSTATUS UnmapPhysical(PVOID a1, PVOID a2) {
	NTSTATUS status = ZwUnmapViewOfSection(PsGetCurrentProcessId(), a2);
	ZwClose(a1);

	return status;
}