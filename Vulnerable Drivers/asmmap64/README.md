# ASMMAP64
 Reverse Engineering ASMMAP64 Kernel Driver

 ## DESCRIPTION

File Name: asmmap64.sys

File Size: 35.84 KB (36696 bytes)

File Type: Portable Executable 64

MD5: 464D5A54CF919BF1682613C0956D0441

SHA-1: D736BC2D14AFA9F8A1A513DC833E773776FBBE73


[See full IDA disasembly](Driver%20Codes/ida.asm)




## IMPORTS

Address	            Ordinal	        Name	                                                Library
0000000140002000		            HalTranslateBusAddress	                                HAL
0000000140002010		            IofCompleteRequest	ntoskrnl
0000000140002018		IoCreateSymbolicLink	ntoskrnl
0000000140002020		IoDeleteDevice	ntoskrnl
0000000140002028		IoDeleteSymbolicLink	ntoskrnl
0000000140002030		ObReferenceObjectByHandle	ntoskrnl
0000000140002038		ZwClose	ntoskrnl
0000000140002040		ZwOpenSection	ntoskrnl
0000000140002048		ZwMapViewOfSection	ntoskrnl
0000000140002050		ZwUnmapViewOfSection	ntoskrnl
0000000140002058		MmGetSystemRoutineAddress	ntoskrnl
0000000140002060		ObOpenObjectByPointer	ntoskrnl
0000000140002068		IoDeviceObjectType	ntoskrnl
0000000140002070		IoCreateDevice	ntoskrnl
0000000140002078		ZwSetSecurityObject	ntoskrnl
0000000140002080		RtlGetOwnerSecurityDescriptor	ntoskrnl
0000000140002088		RtlGetDaclSecurityDescriptor	ntoskrnl
0000000140002090		RtlGetGroupSecurityDescriptor	ntoskrnl
0000000140002098		DbgPrint	ntoskrnl
00000001400020A0		SeCaptureSecurityDescriptor	ntoskrnl
00000001400020A8		RtlLengthSecurityDescriptor	ntoskrnl
00000001400020B0		_snwprintf	ntoskrnl
00000001400020B8		ExFreePoolWithTag	ntoskrnl
00000001400020C0		RtlCreateSecurityDescriptor	ntoskrnl
00000001400020C8		RtlLengthSid	ntoskrnl
00000001400020D0		SeExports	ntoskrnl
00000001400020D8		IoIsWdmVersionAvailable	ntoskrnl
00000001400020E0		RtlAbsoluteToSelfRelativeSD	ntoskrnl
00000001400020E8		RtlAddAccessAllowedAce	ntoskrnl
00000001400020F0		RtlSetDaclSecurityDescriptor	ntoskrnl
00000001400020F8		_wcsnicmp	ntoskrnl
0000000140002100		ExAllocatePoolWithTag	ntoskrnl
0000000140002108		wcschr	ntoskrnl
0000000140002110		ZwOpenKey	ntoskrnl
0000000140002118		ZwQueryValueKey	ntoskrnl
0000000140002120		RtlFreeUnicodeString	ntoskrnl
0000000140002128		ZwSetValueKey	ntoskrnl
0000000140002130		ZwCreateKey	ntoskrnl
0000000140002138		RtlGetSaclSecurityDescriptor	ntoskrnl
0000000140002140		RtlInitUnicodeString	ntoskrnl