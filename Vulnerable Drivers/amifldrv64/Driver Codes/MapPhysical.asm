.text:00000000000117B0
.text:00000000000117B0 ; =============== S U B R O U T I N E =======================================
.text:00000000000117B0
.text:00000000000117B0
.text:00000000000117B0 ; __int64 __fastcall MapPhysical(_QWORD *systemBuffer)
.text:00000000000117B0 MapPhysical     proc near               ; CODE XREF: DeviceIoControl+171↓p
.text:00000000000117B0
.text:00000000000117B0 var_B8          = qword ptr -0B8h
.text:00000000000117B0 var_B0          = qword ptr -0B0h
.text:00000000000117B0 var_A8          = qword ptr -0A8h
.text:00000000000117B0 var_A0          = dword ptr -0A0h
.text:00000000000117B0 var_98          = dword ptr -98h
.text:00000000000117B0 var_90          = dword ptr -90h
.text:00000000000117B0 var_88          = dword ptr -88h
.text:00000000000117B0 var_80          = qword ptr -80h
.text:00000000000117B0 var_78          = qword ptr -78h
.text:00000000000117B0 var_70          = qword ptr -70h
.text:00000000000117B0 var_68          = qword ptr -68h
.text:00000000000117B0 var_60          = qword ptr -60h
.text:00000000000117B0 var_58          = qword ptr -58h
.text:00000000000117B0 var_50          = dword ptr -50h
.text:00000000000117B0 var_48          = qword ptr -48h
.text:00000000000117B0 ObjectName      = qword ptr -40h
.text:00000000000117B0 var_38          = dword ptr -38h
.text:00000000000117B0 var_30          = qword ptr -30h
.text:00000000000117B0 var_28          = qword ptr -28h
.text:00000000000117B0 var_20          = byte ptr -20h
.text:00000000000117B0 var_8           = qword ptr -8
.text:00000000000117B0 arg_0           = qword ptr  8
.text:00000000000117B0 arg_8           = qword ptr  10h
.text:00000000000117B0 arg_10          = qword ptr  18h
.text:00000000000117B0 arg_18          = qword ptr  20h
.text:00000000000117B0
.text:00000000000117B0                 mov     rax, rsp
.text:00000000000117B3                 sub     rsp, 0D8h
.text:00000000000117BA                 mov     [rax+8], rbx
.text:00000000000117BE                 mov     ebx, [rcx+0Ch]
.text:00000000000117C1                 mov     [rax+10h], rbp
.text:00000000000117C5                 mov     ebp, [rcx+8]
.text:00000000000117C8                 mov     [rax+18h], rsi
.text:00000000000117CC                 mov     [rax+20h], rdi
.text:00000000000117D0                 mov     rsi, rcx
.text:00000000000117D3                 mov     [rax-8], r12
.text:00000000000117D7                 xor     r12d, r12d
.text:00000000000117DA                 lea     rcx, [rax-20h]
.text:00000000000117DE                 lea     rdx, aDevicePhysical ; "\\Device\\PhysicalMemory"
.text:00000000000117E5                 mov     [rax-58h], r12
.text:00000000000117E9                 mov     [rax-70h], r12
.text:00000000000117ED                 call    cs:RtlInitUnicodeString
.text:00000000000117F3                 lea     rax, [rsp+0D8h+var_20]
.text:00000000000117FB                 lea     r8, [rsp+0D8h+var_50] ; # ObjectAttributes
.text:0000000000011803                 mov     edx, 0F001Fh
.text:0000000000011808                 mov     rcx, rsi        ; # SectionHandle
.text:000000000001180B                 mov     [rsp+0D8h+ObjectName], rax ; # UNICODE_STRING
.text:0000000000011813                 mov     [rsp+0D8h+var_50], 30h ; '0'
.text:000000000001181E                 mov     [rsp+0D8h+var_48], r12
.text:0000000000011826                 mov     [rsp+0D8h+var_38], 240h
.text:0000000000011831                 mov     [rsp+0D8h+var_30], r12
.text:0000000000011839                 mov     [rsp+0D8h+var_28], r12
.text:0000000000011841                 mov     [rsi], r12
.text:0000000000011844                 call    cs:ZwOpenSection
.text:000000000001184A                 test    eax, eax
.text:000000000001184C                 mov     edi, eax
.text:000000000001184E                 js      loc_11967
.text:0000000000011854                 mov     rcx, [rsi]
.text:0000000000011857                 lea     rax, [rsp+0D8h+var_58]
.text:000000000001185F                 xor     r9d, r9d
.text:0000000000011862                 xor     r8d, r8d
.text:0000000000011865                 mov     edx, 0F001Fh
.text:000000000001186A                 mov     [rsp+0D8h+var_B0], r12
.text:000000000001186F                 mov     [rsp+0D8h+var_B8], rax
.text:0000000000011874                 call    cs:ObReferenceObjectByHandle
.text:000000000001187A                 test    eax, eax
.text:000000000001187C                 mov     edi, eax
.text:000000000001187E                 js      loc_11967
.text:0000000000011884                 lea     rax, [rbx+rbp]
.text:0000000000011888                 xor     edx, edx
.text:000000000001188A                 lea     r9, [rsp+0D8h+var_88]
.text:000000000001188F                 mov     [rsp+0D8h+var_80], rax
.text:0000000000011894                 lea     rax, [rsp+0D8h+var_78]
.text:0000000000011899                 lea     ecx, [rdx+1]
.text:000000000001189C                 mov     r8, rbx
.text:000000000001189F                 mov     [rsp+0D8h+var_78], rbx
.text:00000000000118A4                 mov     [rsp+0D8h+var_88], r12d
.text:00000000000118A9                 mov     [rsp+0D8h+var_B8], rax
.text:00000000000118AE                 call    cs:HalTranslateBusAddress
.text:00000000000118B4                 mov     r8, [rsp+0D8h+var_80]
.text:00000000000118B9                 xor     edx, edx
.text:00000000000118BB                 movzx   ebx, al
.text:00000000000118BE                 lea     rax, [rsp+0D8h+var_80]
.text:00000000000118C3                 lea     r9, [rsp+0D8h+var_88]
.text:00000000000118C8                 lea     ecx, [rdx+1]
.text:00000000000118CB                 mov     [rsp+0D8h+var_88], r12d
.text:00000000000118D0                 mov     [rsp+0D8h+var_B8], rax
.text:00000000000118D5                 call    cs:HalTranslateBusAddress
.text:00000000000118DB                 test    bl, bl
.text:00000000000118DD                 jz      loc_11970
.text:00000000000118E3                 test    al, al
.text:00000000000118E5                 jz      loc_11970
.text:00000000000118EB                 mov     rax, [rsp+0D8h+var_80]
.text:00000000000118F0                 mov     rcx, [rsp+0D8h+var_78]
.text:00000000000118F5                 sub     rax, rcx
.text:00000000000118F8                 test    eax, eax
.text:00000000000118FA                 jz      short loc_11970
.text:00000000000118FC                 mov     [rsp+0D8h+var_90], 204h
.text:0000000000011904                 mov     [rsp+0D8h+var_98], r12d
.text:0000000000011909                 mov     [rsp+0D8h+var_68], rcx
.text:000000000001190E                 mov     ecx, eax
.text:0000000000011910                 mov     [rsp+0D8h+var_A0], 1
.text:0000000000011918                 lea     rax, [rsp+0D8h+var_60]
.text:000000000001191D                 mov     [rsp+0D8h+var_A8], rax
.text:0000000000011922                 lea     rax, [rsp+0D8h+var_68]
.text:0000000000011927                 mov     [rsp+0D8h+var_60], rcx
.text:000000000001192C                 mov     [rsp+0D8h+var_B0], rax
.text:0000000000011931                 mov     [rsp+0D8h+var_B8], rcx
.text:0000000000011936                 mov     rcx, [rsi]
.text:0000000000011939                 lea     r8, [rsp+0D8h+var_70]
.text:000000000001193E                 lea     rdx, [r12-1]
.text:0000000000011943                 xor     r9d, r9d
.text:0000000000011946                 call    cs:ZwMapViewOfSection
.text:000000000001194C                 test    eax, eax
.text:000000000001194E                 mov     edi, eax
.text:0000000000011950                 js      short loc_11967
.text:0000000000011952                 mov     ecx, dword ptr [rsp+0D8h+var_78]
.text:0000000000011956                 mov     rax, [rsp+0D8h+var_70]
.text:000000000001195B                 sub     ecx, dword ptr [rsp+0D8h+var_68]
.text:000000000001195F                 add     rax, rcx
.text:0000000000011962                 mov     [rsi+10h], eax
.text:0000000000011965                 jmp     short loc_11970
.text:0000000000011967 ; ---------------------------------------------------------------------------
.text:0000000000011967
.text:0000000000011967 loc_11967:                              ; CODE XREF: MapPhysical+9E↑j
.text:0000000000011967                                         ; MapPhysical+CE↑j ...
.text:0000000000011967                 mov     rcx, [rsi]
.text:000000000001196A                 call    cs:ZwClose
.text:0000000000011970
.text:0000000000011970 loc_11970:                              ; CODE XREF: MapPhysical+12D↑j
.text:0000000000011970                                         ; MapPhysical+135↑j ...
.text:0000000000011970                 mov     r12, [rsp+0D8h+var_8]
.text:0000000000011978                 mov     rsi, [rsp+0D8h+arg_10]
.text:0000000000011980                 mov     rbp, [rsp+0D8h+arg_8]
.text:0000000000011988                 mov     rbx, [rsp+0D8h+arg_0]
.text:0000000000011990                 mov     eax, edi
.text:0000000000011992                 mov     rdi, [rsp+0D8h+arg_18]
.text:000000000001199A                 add     rsp, 0D8h
.text:00000000000119A1                 retn
.text:00000000000119A1 MapPhysical     endp
.text:00000000000119A1
.text:00000000000119A1 ; ---------------------------------------------------------------------------
