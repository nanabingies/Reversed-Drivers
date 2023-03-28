.text:0000000140001060
.text:0000000140001060 ; =============== S U B R O U T I N E =======================================
.text:0000000140001060
.text:0000000140001060
.text:0000000140001060 ; __int64 __fastcall Fn_CreateDevice(__int64, unsigned int, __int64, _QWORD *)
.text:0000000140001060 Fn_CreateDevice proc near               ; CODE XREF: DriverEntry+3C↑p
.text:0000000140001060
.text:0000000140001060 var_68          = dword ptr -68h
.text:0000000140001060 var_60          = byte ptr -60h
.text:0000000140001060 var_58          = qword ptr -58h
.text:0000000140001060 var_50          = qword ptr -50h
.text:0000000140001060 var_48          = qword ptr -48h
.text:0000000140001060 var_38          = byte ptr -38h
.text:0000000140001060 var_28          = byte ptr -28h
.text:0000000140001060 var_18          = byte ptr -18h
.text:0000000140001060 var_8           = byte ptr -8
.text:0000000140001060 arg_0           = qword ptr  8
.text:0000000140001060 arg_8           = qword ptr  10h
.text:0000000140001060
.text:0000000140001060                 mov     [rsp+arg_0], rbx
.text:0000000140001065                 mov     [rsp+arg_8], rsi
.text:000000014000106A                 push    rdi
.text:000000014000106B                 sub     rsp, 80h
.text:0000000140001072                 mov     ebx, edx
.text:0000000140001074                 mov     rsi, r9
.text:0000000140001077                 mov     rdx, rcx
.text:000000014000107A                 mov     rdi, r8
.text:000000014000107D                 lea     rcx, [rsp+88h+var_38]
.text:0000000140001082                 call    cs:RtlInitUnicodeString
.text:0000000140001088                 lea     rdx, aDPAGaSyAGrgwgx ; "D:P(A;;GA;;;SY)(A;;GRGWGX;;;BA)"
.text:000000014000108F                 lea     rcx, [rsp+88h+var_28]
.text:0000000140001094                 call    cs:RtlInitUnicodeString
.text:000000014000109A                 mov     [rsp+88h+var_48], rsi
.text:000000014000109F                 lea     rax, [rsp+88h+var_28]
.text:00000001400010A4                 and     [rsp+88h+var_50], 0
.text:00000001400010AA                 lea     r8, [rsp+88h+var_38]
.text:00000001400010AF                 mov     [rsp+88h+var_58], rax
.text:00000001400010B4                 mov     r9d, ebx
.text:00000001400010B7                 mov     [rsp+88h+var_60], 0
.text:00000001400010BC                 mov     edx, 10h
.text:00000001400010C1                 and     [rsp+88h+var_68], 0
.text:00000001400010C6                 mov     rcx, rdi
.text:00000001400010C9                 call    WdmlibIoCreateDeviceSecure
.text:00000001400010CE                 test    eax, eax
.text:00000001400010D0                 js      short loc_140001115
.text:00000001400010D2                 mov     rax, [rsi]      ; # Type
.text:00000001400010D5                 xor     edx, edx
.text:00000001400010D7                 mov     rcx, [rax+40h]
.text:00000001400010DB                 mov     [rcx], rdx
.text:00000001400010DE                 mov     [rcx+8], rdx
.text:00000001400010E2                 lea     rdx, aDosdevicesAsmm ; "\\DosDevices\\ASMMAP64"
.text:00000001400010E9                 lea     rcx, [rsp+88h+var_18]
.text:00000001400010EE                 call    cs:RtlInitUnicodeString
.text:00000001400010F4                 lea     rdx, [rsp+88h+var_38]
.text:00000001400010F9                 lea     rcx, [rsp+88h+var_18]
.text:00000001400010FE                 call    cs:IoCreateSymbolicLink
.text:0000000140001104                 mov     ebx, eax
.text:0000000140001106                 test    eax, eax
.text:0000000140001108                 jns     short loc_140001113
.text:000000014000110A                 mov     rcx, [rsi]
.text:000000014000110D                 call    cs:IoDeleteDevice
.text:0000000140001113
.text:0000000140001113 loc_140001113:                          ; CODE XREF: Fn_CreateDevice+A8↑j
.text:0000000140001113                 mov     eax, ebx
.text:0000000140001115
.text:0000000140001115 loc_140001115:                          ; CODE XREF: Fn_CreateDevice+70↑j
.text:0000000140001115                 lea     r11, [rsp+88h+var_8]
.text:000000014000111D                 mov     rbx, [r11+10h]
.text:0000000140001121                 mov     rsi, [r11+18h]
.text:0000000140001125                 mov     rsp, r11
.text:0000000140001128                 pop     rdi
.text:0000000140001129                 retn
.text:0000000140001129 Fn_CreateDevice endp
.text:0000000140001129
.text:0000000140001129 ; ---------------------------------------------------------------------------