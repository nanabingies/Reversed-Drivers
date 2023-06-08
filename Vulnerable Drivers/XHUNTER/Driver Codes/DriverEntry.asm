text:0000000140003F98 ; =============== S U B R O U T I N E =======================================
.text:0000000140003F98
.text:0000000140003F98 ; Attributes: bp-based frame
.text:0000000140003F98
.text:0000000140003F98 ; __int64 __fastcall DriverEntry(_QWORD *DriverObject, _WORD *RegistryPath)
.text:0000000140003F98 DriverEntry     proc near               ; CODE XREF: start+25↓j
.text:0000000140003F98
.text:0000000140003F98 var_50          = dword ptr -50h
.text:0000000140003F98 var_48          = byte ptr -48h
.text:0000000140003F98 var_40          = qword ptr -40h
.text:0000000140003F98 var_30          = xmmword ptr -30h
.text:0000000140003F98 DriverName      = byte ptr -20h
.text:0000000140003F98 DosDeviceName   = xmmword ptr -10h
.text:0000000140003F98 var_s0          = byte ptr  0
.text:0000000140003F98 arg_0           = qword ptr  10h
.text:0000000140003F98 DeviceObject    = qword ptr  18h
.text:0000000140003F98 arg_10          = qword ptr  20h
.text:0000000140003F98 arg_18          = qword ptr  28h
.text:0000000140003F98
.text:0000000140003F98                 mov     [rsp-8+arg_0], rbx
.text:0000000140003F9D                 mov     [rsp-8+arg_10], rsi
.text:0000000140003FA2                 mov     [rsp-8+arg_18], rdi
.text:0000000140003FA7                 push    rbp
.text:0000000140003FA8                 mov     rbp, rsp
.text:0000000140003FAB                 sub     rsp, 70h
.text:0000000140003FAF                 xor     esi, esi
.text:0000000140003FB1                 mov     rdi, rcx        ; # DriverObject
.text:0000000140003FB4                 mov     [rbp+DeviceObject], rsi
.text:0000000140003FB8                 cmp     [rdx], si       ; # is RegistryPath empty??
.text:0000000140003FBB                 jnz     short loc_140003FC7
.text:0000000140003FBD
.text:0000000140003FBD loc_140003FBD:                          ; CODE XREF: DriverEntry+3A↓j
.text:0000000140003FBD                                         ; DriverEntry+56↓j
.text:0000000140003FBD                 mov     eax, 0C0000001h
.text:0000000140003FC2                 jmp     loc_140004102
.text:0000000140003FC7 ; ---------------------------------------------------------------------------
.text:0000000140003FC7
.text:0000000140003FC7 loc_140003FC7:                          ; CODE XREF: DriverEntry+23↑j
.text:0000000140003FC7                 lea     rcx, [rbp+var_30]
.text:0000000140003FCB                 call    sub_140004234
.text:0000000140003FD0                 test    eax, eax        ; # if (!NT_SUCCESS())
.text:0000000140003FD2                 js      short loc_140003FBD
.text:0000000140003FD4                 lea     rdx, [rbp+var_30]
.text:0000000140003FD8                 lea     rcx, [rbp+DosDeviceName]
.text:0000000140003FDC                 call    sub_14000366C
.text:0000000140003FE1                 test    eax, eax
.text:0000000140003FE3                 jns     short loc_140003FF0
.text:0000000140003FE5                 lea     rcx, [rbp+var_30]
.text:0000000140003FE9                 call    sub_14000429C
.text:0000000140003FEE                 jmp     short loc_140003FBD
.text:0000000140003FF0 ; ---------------------------------------------------------------------------
.text:0000000140003FF0
.text:0000000140003FF0 loc_140003FF0:                          ; CODE XREF: DriverEntry+4B↑j
.text:0000000140003FF0                 lea     rdx, [rbp+var_30]
.text:0000000140003FF4                 lea     rcx, [rbp+DriverName]
.text:0000000140003FF8                 call    sub_1400035CC
.text:0000000140003FFD                 test    eax, eax
.text:0000000140003FFF                 jns     short loc_140004011
.text:0000000140004001                 lea     rcx, [rbp+var_30]
.text:0000000140004005                 call    sub_14000429C
.text:000000014000400A                 mov     ebx, 0C0000001h
.text:000000014000400F                 jmp     short loc_140004082
.text:0000000140004011 ; ---------------------------------------------------------------------------
.text:0000000140004011
.text:0000000140004011 loc_140004011:                          ; CODE XREF: DriverEntry+67↑j
.text:0000000140004011                 lea     rax, DriverUnload
.text:0000000140004018                 mov     r9d, 22h ; '"'
.text:000000014000401E                 mov     [rdi+68h], rax  ; # DriverUnload
.text:0000000140004022                 lea     r8, [rbp+DriverName]
.text:0000000140004026                 lea     rax, IRP_MJ_CREATE
.text:000000014000402D                 xor     edx, edx
.text:000000014000402F                 mov     [rdi+70h], rax  ; # IRP_MJ_CREATE
.text:0000000140004033                 mov     rcx, rdi
.text:0000000140004036                 lea     rax, IRP_MJ_CLOSE
.text:000000014000403D                 mov     [rdi+80h], rax
.text:0000000140004044                 lea     rax, IRP_MJ_WRITE
.text:000000014000404B                 mov     [rdi+90h], rax
.text:0000000140004052                 lea     rax, [rbp+DeviceObject]
.text:0000000140004056                 mov     [rsp+70h+var_40], rax
.text:000000014000405B                 mov     [rsp+70h+var_48], sil
.text:0000000140004060                 mov     [rsp+70h+var_50], esi
.text:0000000140004064                 call    cs:IoCreateDevice
.text:000000014000406A                 mov     ebx, eax
.text:000000014000406C                 test    eax, eax
.text:000000014000406E                 jns     short loc_140004088
.text:0000000140004070                 lea     rcx, [rbp+var_30]
.text:0000000140004074                 call    sub_14000429C
.text:0000000140004079                 lea     rcx, [rbp+DriverName]
.text:000000014000407D                 call    sub_14000429C
.text:0000000140004082
.text:0000000140004082 loc_140004082:                          ; CODE XREF: DriverEntry+77↑j
.text:0000000140004082                 lea     rcx, [rbp+DosDeviceName]
.text:0000000140004086                 jmp     short loc_1400040FB
.text:0000000140004088 ; ---------------------------------------------------------------------------
.text:0000000140004088
.text:0000000140004088 loc_140004088:                          ; CODE XREF: DriverEntry+D6↑j
.text:0000000140004088                 mov     rax, [rbp+DeviceObject]
.text:000000014000408C                 or      dword ptr [rax+30h], 4 ; # Flags
.text:0000000140004090                 movups  xmm0, [rbp+var_30]
.text:0000000140004094                 movups  xmm1, [rbp+DosDeviceName]
.text:0000000140004098                 movdqu  cs:xmmword_14000A4F0, xmm0
.text:00000001400040A0                 movdqu  cs:xmmword_14000A500, xmm1
.text:00000001400040A8                 call    Fn_SetupCallbackStructure
.text:00000001400040AD                 mov     rcx, rdi
.text:00000001400040B0                 call    Fn_RegisterProcessCallbacks
.text:00000001400040B5                 mov     ebx, eax
.text:00000001400040B7                 test    eax, eax
.text:00000001400040B9                 js      short loc_1400040E9
.text:00000001400040BB                 call    Fn_GetKernelFunctionsAddress
.text:00000001400040C0                 mov     ebx, eax
.text:00000001400040C2                 test    eax, eax
.text:00000001400040C4                 js      short loc_1400040DF
.text:00000001400040C6                 lea     rdx, [rbp+DriverName]
.text:00000001400040CA                 lea     rcx, [rbp+DosDeviceName]
.text:00000001400040CE                 call    cs:IoCreateSymbolicLink
.text:00000001400040D4                 mov     ebx, eax
.text:00000001400040D6                 test    eax, eax
.text:00000001400040D8                 jns     short loc_1400040F5
.text:00000001400040DA                 call    _guard_check_icall_nop
.text:00000001400040DF
.text:00000001400040DF loc_1400040DF:                          ; CODE XREF: DriverEntry+12C↑j
.text:00000001400040DF                 call    sub_140003238
.text:00000001400040E4                 call    _guard_check_icall_nop
.text:00000001400040E9
.text:00000001400040E9 loc_1400040E9:                          ; CODE XREF: DriverEntry+121↑j
.text:00000001400040E9                 mov     rcx, [rbp+DeviceObject]
.text:00000001400040ED                 call    cs:IoDeleteDevice
.text:00000001400040F3                 jmp     short loc_1400040F7
.text:00000001400040F5 ; ---------------------------------------------------------------------------
.text:00000001400040F5
.text:00000001400040F5 loc_1400040F5:                          ; CODE XREF: DriverEntry+140↑j
.text:00000001400040F5                 mov     ebx, esi
.text:00000001400040F7
.text:00000001400040F7 loc_1400040F7:                          ; CODE XREF: DriverEntry+15B↑j
.text:00000001400040F7                 lea     rcx, [rbp+DriverName]
.text:00000001400040FB
.text:00000001400040FB loc_1400040FB:                          ; CODE XREF: DriverEntry+EE↑j
.text:00000001400040FB                 call    sub_14000429C
.text:0000000140004100                 mov     eax, ebx
.text:0000000140004102
.text:0000000140004102 loc_140004102:                          ; CODE XREF: DriverEntry+2A↑j
.text:0000000140004102                 lea     r11, [rsp+70h+var_s0]
.text:0000000140004107                 mov     rbx, [r11+10h]
.text:000000014000410B                 mov     rsi, [r11+20h]
.text:000000014000410F                 mov     rdi, [r11+28h]
.text:0000000140004113                 mov     rsp, r11
.text:0000000140004116                 pop     rbp
.text:0000000140004117                 retn
.text:0000000140004117 DriverEntry     endp
.text:0000000140004117
