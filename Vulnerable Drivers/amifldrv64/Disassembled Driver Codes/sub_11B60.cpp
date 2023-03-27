
NTSTATUS sub_11B60(PVOID systemBuffer, PVOID devExt) {
	PVOID v2, v3, v4;

	v2 = *(PVOID*)((PUCHAR)devExt + 0x8);
	v3 = *(PVOID*)((PUCHAR)devExt + 0x18);
	v4 = *(PVOID*)((PUCHAR)devExt + 0x10);

	if (v2 == nullptr && v3 == nullptr && v4 == nullptr) {
		return STATUS_SUCCESS;
	}

	MmUnmapLockedPages(v2, (PMDL)v3);
	IoFreeMdl((PMDL)v3);
	MmFreeContiguousMemory(v4);

	return STATUS_SUCCESS;
}