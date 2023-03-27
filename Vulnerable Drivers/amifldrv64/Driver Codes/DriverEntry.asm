.text:0000000000011F40
.text:0000000000011F40 ; =============== S U B R O U T I N E =======================================
.text:0000000000011F40
.text:0000000000011F40
.text:0000000000011F40 DriverEntry     proc near               ; CODE XREF: start+54↓j
.text:0000000000011F40
.text:0000000000011F40 var_58          = dword ptr -58h
.text:0000000000011F40 var_50          = byte ptr -50h
.text:0000000000011F40 var_48          = qword ptr -48h
.text:0000000000011F40 DeviceObject    = qword ptr -38h
.text:0000000000011F40 DriverString    = byte ptr -30h
.text:0000000000011F40 DriverSysmbolString= byte ptr -20h
.text:0000000000011F40 arg_10          = qword ptr  18h
.text:0000000000011F40 arg_18          = qword ptr  20h
.text:0000000000011F40
.text:0000000000011F40                 sub     rsp, 78h
.text:0000000000011F44                 mov     [rsp+78h+arg_18], rdi
.text:0000000000011F4C                 mov     rdi, rcx        ; # DriverObject
.text:0000000000011F4F                 lea     rdx, aDeviceGenericd ; "\\Device\\genericdrv"
.text:0000000000011F56                 lea     rcx, [rsp+78h+DriverString]
.text:0000000000011F5B                 call    cs:RtlInitUnicodeString
.text:0000000000011F61                 lea     r11, [rsp+78h+DeviceObject]
.text:0000000000011F66                 lea     r8, [rsp+78h+DriverString]
.text:0000000000011F6B                 mov     [rsp+78h+var_48], r11
.text:0000000000011F70                 mov     r9d, 0FA00h
.text:0000000000011F76                 mov     edx, 20h ; ' '
.text:0000000000011F7B                 mov     rcx, rdi
.text:0000000000011F7E                 mov     [rsp+78h+var_50], 0
.text:0000000000011F83                 mov     [rsp+78h+var_58], 0
.text:0000000000011F8B                 call    cs:IoCreateDevice
.text:0000000000011F91                 test    eax, eax
.text:0000000000011F93                 js      loc_1202C       ; # jump failure
.text:0000000000011F99                 lea     rdx, aGenericdrv ; "\\??\\genericdrv"
.text:0000000000011FA0                 lea     rcx, [rsp+78h+DriverSysmbolString]
.text:0000000000011FA5                 mov     [rsp+78h+arg_10], rbx
.text:0000000000011FAD                 call    cs:RtlInitUnicodeString
.text:0000000000011FB3                 lea     rdx, [rsp+78h+DriverString]
.text:0000000000011FB8                 lea     rcx, [rsp+78h+DriverSysmbolString]
.text:0000000000011FBD                 call    cs:IoCreateSymbolicLink
.text:0000000000011FC3                 test    eax, eax
.text:0000000000011FC5                 mov     ebx, eax
.text:0000000000011FC7                 jns     short loc_11FD6
.text:0000000000011FC9                 mov     rcx, [rsp+78h+DeviceObject]
.text:0000000000011FCE                 call    cs:IoDeleteDevice
.text:0000000000011FD4                 jmp     short loc_12022
.text:0000000000011FD6 ; ---------------------------------------------------------------------------
.text:0000000000011FD6
.text:0000000000011FD6 loc_11FD6:                              ; CODE XREF: DriverEntry+87↑j
.text:0000000000011FD6                 lea     rax, IOCTL
.text:0000000000011FDD                 xor     edx, edx
.text:0000000000011FDF                 mov     [rdi+0E0h], rax
.text:0000000000011FE6                 mov     [rdi+90h], rax
.text:0000000000011FED                 mov     [rdi+88h], rax
.text:0000000000011FF4                 mov     [rdi+80h], rax
.text:0000000000011FFB                 mov     [rdi+70h], rax
.text:0000000000011FFF                 lea     rax, DriverUnload
.text:0000000000012006                 mov     [rdi+68h], rax
.text:000000000001200A                 mov     rax, [rsp+78h+DeviceObject]
.text:000000000001200F                 mov     rcx, [rax+40h]
.text:0000000000012013                 mov     [rcx], rdx
.text:0000000000012016                 mov     [rcx+8], rdx
.text:000000000001201A                 mov     [rcx+10h], rdx
.text:000000000001201E                 mov     [rcx+18h], rdx
.text:0000000000012022
.text:0000000000012022 loc_12022:                              ; CODE XREF: DriverEntry+94↑j
.text:0000000000012022                 mov     eax, ebx
.text:0000000000012024                 mov     rbx, [rsp+78h+arg_10]
.text:000000000001202C
.text:000000000001202C loc_1202C:                              ; CODE XREF: DriverEntry+53↑j
.text:000000000001202C                 mov     rdi, [rsp+78h+arg_18]
.text:0000000000012034                 add     rsp, 78h
.text:0000000000012038                 retn
.text:0000000000012038 DriverEntry     endp
.text:0000000000012038
.text:0000000000012038 ; ---------------------------------------------------------------------------
