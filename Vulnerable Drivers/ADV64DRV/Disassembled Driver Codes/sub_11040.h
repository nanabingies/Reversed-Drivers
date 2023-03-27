#pragma once
#include <wdm.h>

bool HalTranslateBusAddress(INTERFACE_TYPE InterfaceType,
	ULONG BusNumber, 
	PHYSICAL_ADDRESS BusAddress,
	PULONG AddressSpace, 
	PPHYSICAL_ADDRESS TranslatedAddress);

#pragma pack(push, 1)
typedef struct _user_args {
	ULONG64 Param1;		// 0x0
	ULONG64 Param2;		// 0x8
}user_args, *puser_args;

NTSTATUS sub_11040(PVOID a1, PIRP Irp, PIO_STACK_LOCATION StackLocation) {
	if (StackLocation->Parameters.DeviceIoControl.InputBufferLength < 0x10) {
		return STATUS_BUFFER_TOO_SMALL;
	}

	user_args* args_user = (user_args*)Irp->AssociatedIrp.SystemBuffer;
	if (StackLocation->Parameters.DeviceIoControl.OutputBufferLength < sizeof(args_user->Param2)) {
		return STATUS_BUFFER_TOO_SMALL;
	}

	ULONG AddressSpace = 0x0;
	PHYSICAL_ADDRESS PhysicalAddress;
	PhysicalAddress.QuadPart = args_user->Param1;
	if (!HalTranslateBusAddress(Isa, 0, PhysicalAddress, &AddressSpace, &PhysicalAddress)) {
		return STATUS_SOME_NOT_MAPPED;
	}

	PVOID MappedIo = MmMapIoSpace(PhysicalAddress, args_user->Param2, MmNonCached);
	memmove((void*)args_user->Param1, MappedIo, args_user->Param2);
	MmUnmapIoSpace(MappedIo, args_user->Param2);

	Irp->IoStatus.Information = args_user->Param2;
	return STATUS_SUCCESS;
}