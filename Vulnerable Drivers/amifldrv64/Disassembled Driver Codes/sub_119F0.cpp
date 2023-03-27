
struct _v2 {
	ULONG a1;		// 0x00
	ULONG a2;		// 0x04
	ULONG a3;		// 0x08
	ULONG a4;		// 0x0C
	ULONG a5;		// 0x10
	PVOID a6;		// 0x18
};
NTSTATUS sub_119F0(PVOID* systemBuffer, PVOID* devExt) {
	if (!systemBuffer) {
		return STATUS_UNSUCCESSFUL;
	}

	PHYSICAL_ADDRESS physAddress = { 0 };
	PHYSICAL_ADDRESS physAddr = { 0 };
	ULONG var_C, var_14, var_18;
	PVOID mem, virtAddress;
	PMDL mdl;

	var_C = var_14 = var_18 = 0;
	struct _v2* v2 = (struct _v2*)(systemBuffer);
	
	physAddress.LowPart = 0x1FFFFFFF;
	physAddress.HighPart = 0x0;
	mem = MmAllocateContiguousMemory(v2->a1, physAddress);
	if (mem == nullptr || !MmIsAddressValid(mem)) {
		return STATUS_UNSUCCESSFUL;
	}

	physAddr = MmGetPhysicalAddress(mem);
	v2->a3 = physAddr.LowPart;
	*(ULONG*)((PUCHAR)devExt + 0x00) = physAddr.LowPart;
	v2->a3 = physAddr.LowPart;

	mdl = IoAllocateMdl(mem, v2->a1, FALSE, FALSE, nullptr);
	if (mdl == nullptr) {
		MmFreeContiguousMemory(mem);
		return STATUS_UNSUCCESSFUL;
	}

	MmBuildMdlForNonPagedPool(mdl);
	PsGetVersion(&var_18, &var_14, nullptr, nullptr);
	if (var_18 < 6 || var_14 < 1) {
		virtAddress = MmMapLockedPages(mdl, 1);
	}
	else {
		virtAddress = MmMapLockedPagesSpecifyCache(mdl, UserMode, MmCached, nullptr, 0, NormalPagePriority);
	}
	if (virtAddress == nullptr) {
		IoFreeMdl(mdl);
		MmFreeContiguousMemory(mem);
		return STATUS_UNSUCCESSFUL;
	}

	v2->a2 = (ULONG)virtAddress;
	v2->a5 = (ULONG)mdl;
	v2->a4 = (ULONG)mem;
	
	*(PVOID*)((PUCHAR)devExt + 0x18) = mdl;
	*(PVOID*)((PUCHAR)devExt + 0x10) = mem;
	*(PVOID*)((PUCHAR)devExt + 0x8) = virtAddress;
	
	return STATUS_SUCCESS;
}