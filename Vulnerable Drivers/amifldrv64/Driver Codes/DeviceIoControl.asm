.text:0000000000011C00
.text:0000000000011C00 ; =============== S U B R O U T I N E =======================================
.text:0000000000011C00
.text:0000000000011C00 ; DeviceIoControl(IoControlCode, SystemBuffer, InputBufferLength, SystemBuffer, OutputBufferLength, &arg_0)
.text:0000000000011C00 ; rdi=SystemBuffer, rsi=SystemBuffer, ecx=ctlcode
.text:0000000000011C00 ; Attributes: library function
.text:0000000000011C00
.text:0000000000011C00 ; __int64 __fastcall DeviceIoControl(int, __int64, unsigned int, _WORD *, unsigned int, _DWORD *, __int64)
.text:0000000000011C00 DeviceIoControl proc near               ; CODE XREF: IOCTL+52↓p
.text:0000000000011C00
.text:0000000000011C00 var_18          = qword ptr -18h
.text:0000000000011C00 var_10          = qword ptr -10h
.text:0000000000011C00 var_8           = qword ptr -8
.text:0000000000011C00 arg_20          = dword ptr  28h
.text:0000000000011C00 arg_28          = qword ptr  30h
.text:0000000000011C00 arg_30          = qword ptr  38h
.text:0000000000011C00
.text:0000000000011C00                 sub     rsp, 38h
.text:0000000000011C04                 mov     [rsp+38h+var_8], rbx
.text:0000000000011C09                 mov     [rsp+38h+var_10], rsi
.text:0000000000011C0E                 add     ecx, 5FFD120h   ; switch 61 cases
.text:0000000000011C14                 cmp     ecx, 3Ch        ; # ecx = IoControlCode
.text:0000000000011C17                 mov     [rsp+38h+var_18], rdi
.text:0000000000011C1C                 mov     rsi, r9         ; # SystemBuffer
.text:0000000000011C1F                 mov     rdi, rdx        ; # SystemBuffer
.text:0000000000011C22                 ja      def_11C41       ; jumptable 0000000000011C41 default case, cases -100651295--100651293,-100651291--100651289,-100651287--100651285,-100651283--100651281,-100651279--100651273,-100651271--100651269,-100651267--100651257,-100651255--100651237
.text:0000000000011C28                 lea     rdx, cs:10000h
.text:0000000000011C2F                 movzx   eax, ds:(byte_11E68 - 10000h)[rdx+rcx]
.text:0000000000011C37                 mov     ecx, ds:(jpt_11C41 - 10000h)[rdx+rax*4]
.text:0000000000011C3E                 add     rcx, rdx
.text:0000000000011C41                 jmp     rcx             ; switch jump
.text:0000000000011C43 ; ---------------------------------------------------------------------------
.text:0000000000011C43
.text:0000000000011C43 loc_11C43:                              ; CODE XREF: DeviceIoControl+41↑j
.text:0000000000011C43                                         ; DATA XREF: .text:jpt_11C41↓o
.text:0000000000011C43                 test    r9, r9          ; jumptable 0000000000011C41 case -100651296
.text:0000000000011C46                 jz      loc_11E1E
.text:0000000000011C4C                 test    rdi, rdi
.text:0000000000011C4F                 jz      loc_11E1E
.text:0000000000011C55                 mov     eax, [rsp+38h+arg_20]
.text:0000000000011C59                 cmp     eax, r8d
.text:0000000000011C5C                 jz      short loc_11C67
.text:0000000000011C5E                 cmp     eax, 10h
.text:0000000000011C61                 jb      loc_11E1E
.text:0000000000011C67
.text:0000000000011C67 loc_11C67:                              ; CODE XREF: DeviceIoControl+5C↑j
.text:0000000000011C67                 mov     rdx, [rsp+38h+arg_30]
.text:0000000000011C6C                 mov     rcx, rdi
.text:0000000000011C6F                 call    InterestingFunc
.text:0000000000011C74                 test    eax, eax
.text:0000000000011C76                 mov     ebx, eax
.text:0000000000011C78                 jnz     loc_11E2A
.text:0000000000011C7E                 mov     rcx, [rsp+38h+arg_28]
.text:0000000000011C83                 mov     dword ptr [rcx], 14h
.text:0000000000011C89                 jmp     loc_11DC1
.text:0000000000011C8E ; ---------------------------------------------------------------------------
.text:0000000000011C8E
.text:0000000000011C8E loc_11C8E:                              ; CODE XREF: DeviceIoControl+41↑j
.text:0000000000011C8E                                         ; DATA XREF: .text:jpt_11C41↓o
.text:0000000000011C8E                 test    rdi, rdi        ; jumptable 0000000000011C41 case -100651292
.text:0000000000011C91                 jz      loc_11E1E
.text:0000000000011C97                 mov     rdx, [rsp+38h+arg_30]
.text:0000000000011C9C                 mov     rcx, rdi
.text:0000000000011C9F                 call    sub_11B60
.text:0000000000011CA4                 mov     ebx, eax
.text:0000000000011CA6                 mov     rax, [rsp+38h+arg_28]
.text:0000000000011CAB                 mov     dword ptr [rax], 0
.text:0000000000011CB1                 jmp     loc_11E2A
.text:0000000000011CB6 ; ---------------------------------------------------------------------------
.text:0000000000011CB6
.text:0000000000011CB6 loc_11CB6:                              ; CODE XREF: DeviceIoControl+41↑j
.text:0000000000011CB6                                         ; DATA XREF: .text:jpt_11C41↓o
.text:0000000000011CB6                 test    r9, r9          ; jumptable 0000000000011C41 case -100651284
.text:0000000000011CB9                 jz      loc_11E1E
.text:0000000000011CBF                 test    rdi, rdi
.text:0000000000011CC2                 jz      loc_11E1E
.text:0000000000011CC8                 mov     eax, [rsp+38h+arg_20]
.text:0000000000011CCC                 cmp     eax, r8d
.text:0000000000011CCF                 jz      short loc_11CDA
.text:0000000000011CD1                 cmp     eax, 10h
.text:0000000000011CD4                 jb      loc_11E1E
.text:0000000000011CDA
.text:0000000000011CDA loc_11CDA:                              ; CODE XREF: DeviceIoControl+CF↑j
.text:0000000000011CDA                 mov     rcx, rdi
.text:0000000000011CDD                 call    VulnFunc
.text:0000000000011CE2                 test    eax, eax
.text:0000000000011CE4                 mov     ebx, eax
.text:0000000000011CE6                 jnz     loc_11E2A
.text:0000000000011CEC                 mov     rax, [rsp+38h+arg_28]
.text:0000000000011CF1                 lea     r8d, [rbx+10h]
.text:0000000000011CF5                 mov     rdx, rdi
.text:0000000000011CF8                 mov     rcx, rsi
.text:0000000000011CFB                 mov     dword ptr [rax], 10h
.text:0000000000011D01                 call    memmove
.text:0000000000011D06                 jmp     loc_11E2A
.text:0000000000011D0B ; ---------------------------------------------------------------------------
.text:0000000000011D0B
.text:0000000000011D0B loc_11D0B:                              ; CODE XREF: DeviceIoControl+41↑j
.text:0000000000011D0B                                         ; DATA XREF: .text:jpt_11C41↓o
.text:0000000000011D0B                 test    rdi, rdi        ; jumptable 0000000000011C41 case -100651280
.text:0000000000011D0E                 jz      loc_11E1E
.text:0000000000011D14                 cmp     r8d, 10h
.text:0000000000011D18                 jb      loc_11E1E
.text:0000000000011D1E                 mov     rcx, rdi
.text:0000000000011D21                 call    VulnFunc2
.text:0000000000011D26                 mov     ebx, eax
.text:0000000000011D28                 mov     rax, [rsp+38h+arg_28]
.text:0000000000011D2D                 mov     dword ptr [rax], 0
.text:0000000000011D33                 jmp     loc_11E2A
.text:0000000000011D38 ; ---------------------------------------------------------------------------
.text:0000000000011D38
.text:0000000000011D38 loc_11D38:                              ; CODE XREF: DeviceIoControl+41↑j
.text:0000000000011D38                                         ; DATA XREF: .text:jpt_11C41↓o
.text:0000000000011D38                 test    rdi, rdi        ; jumptable 0000000000011C41 case -100651268
.text:0000000000011D3B                 jz      loc_11E1E
.text:0000000000011D41                 cmp     r8d, 16h
.text:0000000000011D45                 jb      loc_11E1E
.text:0000000000011D4B                 mov     rcx, rdi
.text:0000000000011D4E                 call    VulnFunc3
.text:0000000000011D53                 mov     ebx, eax
.text:0000000000011D55                 mov     rax, [rsp+38h+arg_28]
.text:0000000000011D5A                 mov     dword ptr [rax], 16h
.text:0000000000011D60                 jmp     loc_11E2A
.text:0000000000011D65 ; ---------------------------------------------------------------------------
.text:0000000000011D65
.text:0000000000011D65 loc_11D65:                              ; CODE XREF: DeviceIoControl+41↑j
.text:0000000000011D65                                         ; DATA XREF: .text:jpt_11C41↓o
.text:0000000000011D65                 test    rdi, rdi        ; jumptable 0000000000011C41 case -100651288
.text:0000000000011D68                 jz      loc_11E1E
.text:0000000000011D6E                 mov     rcx, rdi
.text:0000000000011D71                 call    MapPhysical
.text:0000000000011D76                 test    eax, eax
.text:0000000000011D78                 mov     ebx, eax
.text:0000000000011D7A                 jnz     loc_11E2A
.text:0000000000011D80                 mov     rax, [rsp+38h+arg_28]
.text:0000000000011D85                 lea     r8d, [rbx+14h]
.text:0000000000011D89                 mov     rdx, rdi
.text:0000000000011D8C                 mov     rcx, rsi
.text:0000000000011D8F                 mov     dword ptr [rax], 14h
.text:0000000000011D95                 call    memmove
.text:0000000000011D9A                 jmp     loc_11E2A
.text:0000000000011D9F ; ---------------------------------------------------------------------------
.text:0000000000011D9F
.text:0000000000011D9F loc_11D9F:                              ; CODE XREF: DeviceIoControl+41↑j
.text:0000000000011D9F                                         ; DATA XREF: .text:jpt_11C41↓o
.text:0000000000011D9F                 test    rdi, rdi        ; jumptable 0000000000011C41 case -100651272
.text:0000000000011DA2                 jz      short loc_11E1E
.text:0000000000011DA4                 movsxd  rdx, dword ptr [rdi+10h]
.text:0000000000011DA8                 mov     rcx, [rdi]
.text:0000000000011DAB                 call    UnmapPhysical
.text:0000000000011DB0                 test    eax, eax
.text:0000000000011DB2                 mov     ebx, eax
.text:0000000000011DB4                 jnz     short loc_11E2A
.text:0000000000011DB6                 mov     rax, [rsp+38h+arg_28]
.text:0000000000011DBB                 mov     dword ptr [rax], 14h
.text:0000000000011DC1
.text:0000000000011DC1 loc_11DC1:                              ; CODE XREF: DeviceIoControl+89↑j
.text:0000000000011DC1                 mov     r8d, 14h
.text:0000000000011DC7                 mov     rdx, rdi
.text:0000000000011DCA                 mov     rcx, rsi
.text:0000000000011DCD                 call    memmove
.text:0000000000011DD2                 jmp     short loc_11E2A
.text:0000000000011DD4 ; ---------------------------------------------------------------------------
.text:0000000000011DD4
.text:0000000000011DD4 loc_11DD4:                              ; CODE XREF: DeviceIoControl+41↑j
.text:0000000000011DD4                                         ; DATA XREF: .text:jpt_11C41↓o
.text:0000000000011DD4                 test    r9, r9          ; jumptable 0000000000011C41 case -100651256
.text:0000000000011DD7                 jnz     short loc_11DE0
.text:0000000000011DD9                 cmp     [rsp+38h+arg_20], 4
.text:0000000000011DDE                 jb      short loc_11E1E
.text:0000000000011DE0
.text:0000000000011DE0 loc_11DE0:                              ; CODE XREF: DeviceIoControl+1D7↑j
.text:0000000000011DE0                 mov     rax, [rsp+38h+arg_28]
.text:0000000000011DE5                 mov     word ptr [r9], 2
.text:0000000000011DEB                 mov     word ptr [r9+2], 3
.text:0000000000011DF2                 mov     dword ptr [rax], 4
.text:0000000000011DF8                 xor     ebx, ebx
.text:0000000000011DFA                 jmp     short loc_11E2A
.text:0000000000011DFC ; ---------------------------------------------------------------------------
.text:0000000000011DFC
.text:0000000000011DFC loc_11DFC:                              ; CODE XREF: DeviceIoControl+41↑j
.text:0000000000011DFC                                         ; DATA XREF: .text:jpt_11C41↓o
.text:0000000000011DFC                 test    rdi, rdi        ; jumptable 0000000000011C41 case -100651236
.text:0000000000011DFF                 jz      short loc_11E1E
.text:0000000000011E01                 cmp     r8d, 26h ; '&'
.text:0000000000011E05                 jb      short loc_11E1E
.text:0000000000011E07                 mov     rcx, rdi
.text:0000000000011E0A                 call    VulnFunc4
.text:0000000000011E0F                 mov     ebx, eax
.text:0000000000011E11                 mov     rax, [rsp+38h+arg_28]
.text:0000000000011E16                 mov     dword ptr [rax], 26h ; '&'
.text:0000000000011E1C                 jmp     short loc_11E2A
.text:0000000000011E1E ; ---------------------------------------------------------------------------
.text:0000000000011E1E
.text:0000000000011E1E loc_11E1E:                              ; CODE XREF: DeviceIoControl+46↑j
.text:0000000000011E1E                                         ; DeviceIoControl+4F↑j ...
.text:0000000000011E1E                 mov     ebx, 0C0000206h
.text:0000000000011E23                 jmp     short loc_11E2A
.text:0000000000011E25 ; ---------------------------------------------------------------------------
.text:0000000000011E25
.text:0000000000011E25 def_11C41:                              ; CODE XREF: DeviceIoControl+22↑j
.text:0000000000011E25                                         ; DeviceIoControl+41↑j
.text:0000000000011E25                                         ; DATA XREF: ...
.text:0000000000011E25                 mov     ebx, 0C000000Dh ; jumptable 0000000000011C41 default case, cases -100651295--100651293,-100651291--100651289,-100651287--100651285,-100651283--100651281,-100651279--100651273,-100651271--100651269,-100651267--100651257,-100651255--100651237
.text:0000000000011E2A
.text:0000000000011E2A loc_11E2A:                              ; CODE XREF: DeviceIoControl+78↑j
.text:0000000000011E2A                                         ; DeviceIoControl+B1↑j ...
.text:0000000000011E2A                 mov     rdi, [rsp+38h+var_18]
.text:0000000000011E2F                 mov     rsi, [rsp+38h+var_10]
.text:0000000000011E34                 mov     eax, ebx
.text:0000000000011E36                 mov     rbx, [rsp+38h+var_8]
.text:0000000000011E3B                 add     rsp, 38h
.text:0000000000011E3F                 retn
.text:0000000000011E3F DeviceIoControl endp
.text:0000000000011E3F
.text:0000000000011E3F ; ---------------------------------------------------------------------------
