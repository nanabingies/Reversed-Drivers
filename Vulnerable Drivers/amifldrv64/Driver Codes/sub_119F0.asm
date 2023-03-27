.text:00000000000119F0
.text:00000000000119F0 ; =============== S U B R O U T I N E =======================================
.text:00000000000119F0
.text:00000000000119F0
.text:00000000000119F0 ; __int64 __fastcall sub_119F0(unsigned int *, __int64)
.text:00000000000119F0 sub_119F0       proc near               ; CODE XREF: DeviceIoControl+6F↓p
.text:00000000000119F0
.text:00000000000119F0 var_28          = qword ptr -28h
.text:00000000000119F0 var_20          = dword ptr -20h
.text:00000000000119F0 var_18          = dword ptr -18h
.text:00000000000119F0 var_14          = dword ptr -14h
.text:00000000000119F0 var_10          = qword ptr -10h
.text:00000000000119F0 var_8           = qword ptr -8
.text:00000000000119F0 arg_0           = qword ptr  8
.text:00000000000119F0 arg_8           = qword ptr  10h
.text:00000000000119F0 arg_10          = qword ptr  18h
.text:00000000000119F0 arg_18          = qword ptr  20h
.text:00000000000119F0
.text:00000000000119F0                 mov     r11, rsp
.text:00000000000119F3                 sub     rsp, 48h
.text:00000000000119F7                 mov     [r11+10h], rbp
.text:00000000000119FB                 mov     [r11+20h], rdi
.text:00000000000119FF                 mov     [r11-8], r12
.text:0000000000011A03                 xor     r12d, r12d
.text:0000000000011A06                 test    rcx, rcx
.text:0000000000011A09                 mov     rbp, rdx
.text:0000000000011A0C                 mov     [r11-18h], r12d
.text:0000000000011A10                 mov     [r11-14h], r12d
.text:0000000000011A14                 mov     [r11-0Ch], r12d
.text:0000000000011A18                 mov     [r11-10h], r12d
.text:0000000000011A1C                 mov     rdi, rcx
.text:0000000000011A1F                 jnz     short loc_11A37
.text:0000000000011A21                 mov     eax, 0C0000001h
.text:0000000000011A26                 mov     r12, [r11-8]
.text:0000000000011A2A                 mov     rdi, [r11+20h]
.text:0000000000011A2E                 mov     rbp, [r11+10h]
.text:0000000000011A32                 add     rsp, 48h
.text:0000000000011A36                 retn
.text:0000000000011A37 ; ---------------------------------------------------------------------------
.text:0000000000011A37
.text:0000000000011A37 loc_11A37:                              ; CODE XREF: sub_119F0+2F↑j
.text:0000000000011A37                 mov     ecx, [rcx]
.text:0000000000011A39                 mov     dword ptr [rsp+48h+var_10+4], r12d
.text:0000000000011A3E                 mov     dword ptr [rsp+48h+var_10], 1FFFFFFFh
.text:0000000000011A46                 mov     rdx, [rsp+48h+var_10]
.text:0000000000011A4B                 mov     [rsp+48h+arg_0], rbx
.text:0000000000011A50                 call    cs:MmAllocateContiguousMemory
.text:0000000000011A56                 test    rax, rax
.text:0000000000011A59                 mov     rbx, rax
.text:0000000000011A5C                 jnz     short loc_11A68
.text:0000000000011A5E
.text:0000000000011A5E loc_11A5E:                              ; CODE XREF: sub_119F0+83↓j
.text:0000000000011A5E                 mov     eax, 0C0000001h
.text:0000000000011A63                 jmp     loc_11B3F
.text:0000000000011A68 ; ---------------------------------------------------------------------------
.text:0000000000011A68
.text:0000000000011A68 loc_11A68:                              ; CODE XREF: sub_119F0+6C↑j
.text:0000000000011A68                 mov     rcx, rax
.text:0000000000011A6B                 call    cs:MmIsAddressValid
.text:0000000000011A71                 test    al, al
.text:0000000000011A73                 jz      short loc_11A5E
.text:0000000000011A75                 mov     rcx, rbx
.text:0000000000011A78                 mov     [rsp+48h+arg_10], rsi
.text:0000000000011A7D                 call    cs:MmGetPhysicalAddress
.text:0000000000011A83                 xor     r9d, r9d
.text:0000000000011A86                 xor     r8d, r8d
.text:0000000000011A89                 mov     [rdi+8], eax
.text:0000000000011A8C                 mov     [rbp+0], eax
.text:0000000000011A8F                 mov     edx, [rdi]
.text:0000000000011A91                 mov     rcx, rbx
.text:0000000000011A94                 mov     [rsp+48h+var_28], r12
.text:0000000000011A99                 call    cs:IoAllocateMdl
.text:0000000000011A9F                 test    rax, rax
.text:0000000000011AA2                 mov     rsi, rax
.text:0000000000011AA5                 jz      short loc_11B11
.text:0000000000011AA7                 mov     rcx, rax
.text:0000000000011AAA                 call    cs:MmBuildMdlForNonPagedPool
.text:0000000000011AB0                 lea     rdx, [rsp+48h+var_14]
.text:0000000000011AB5                 lea     rcx, [rsp+48h+var_18]
.text:0000000000011ABA                 xor     r9d, r9d
.text:0000000000011ABD                 xor     r8d, r8d
.text:0000000000011AC0                 call    cs:PsGetVersion
.text:0000000000011AC6                 cmp     [rsp+48h+var_18], 6
.text:0000000000011ACB                 jb      short loc_11AF9
.text:0000000000011ACD                 cmp     [rsp+48h+var_14], 1
.text:0000000000011AD2                 jb      short loc_11AF9
.text:0000000000011AD4                 mov     r8d, 1
.text:0000000000011ADA                 xor     r9d, r9d
.text:0000000000011ADD                 mov     rcx, rsi
.text:0000000000011AE0                 movzx   edx, r8b
.text:0000000000011AE4                 mov     [rsp+48h+var_20], 10h
.text:0000000000011AEC                 mov     dword ptr [rsp+48h+var_28], r12d
.text:0000000000011AF1                 call    cs:MmMapLockedPagesSpecifyCache
.text:0000000000011AF7                 jmp     short loc_11B04
.text:0000000000011AF9 ; ---------------------------------------------------------------------------
.text:0000000000011AF9
.text:0000000000011AF9 loc_11AF9:                              ; CODE XREF: sub_119F0+DB↑j
.text:0000000000011AF9                                         ; sub_119F0+E2↑j
.text:0000000000011AF9                 mov     dl, 1
.text:0000000000011AFB                 mov     rcx, rsi
.text:0000000000011AFE                 call    cs:MmMapLockedPages
.text:0000000000011B04
.text:0000000000011B04 loc_11B04:                              ; CODE XREF: sub_119F0+107↑j
.text:0000000000011B04                 test    eax, eax
.text:0000000000011B06                 jnz     short loc_11B21
.text:0000000000011B08                 mov     rcx, rsi
.text:0000000000011B0B                 call    cs:IoFreeMdl
.text:0000000000011B11
.text:0000000000011B11 loc_11B11:                              ; CODE XREF: sub_119F0+B5↑j
.text:0000000000011B11                 mov     rcx, rbx
.text:0000000000011B14                 call    cs:MmFreeContiguousMemory
.text:0000000000011B1A                 mov     eax, 0C0000001h
.text:0000000000011B1F                 jmp     short loc_11B3A
.text:0000000000011B21 ; ---------------------------------------------------------------------------
.text:0000000000011B21
.text:0000000000011B21 loc_11B21:                              ; CODE XREF: sub_119F0+116↑j
.text:0000000000011B21                 mov     [rdi+4], eax
.text:0000000000011B24                 mov     [rdi+10h], esi
.text:0000000000011B27                 mov     [rdi+0Ch], ebx
.text:0000000000011B2A                 cdqe
.text:0000000000011B2C                 mov     [rbp+18h], rsi
.text:0000000000011B30                 mov     [rbp+10h], rbx
.text:0000000000011B34                 mov     [rbp+8], rax
.text:0000000000011B38                 xor     eax, eax
.text:0000000000011B3A
.text:0000000000011B3A loc_11B3A:                              ; CODE XREF: sub_119F0+12F↑j
.text:0000000000011B3A                 mov     rsi, [rsp+48h+arg_10]
.text:0000000000011B3F
.text:0000000000011B3F loc_11B3F:                              ; CODE XREF: sub_119F0+73↑j
.text:0000000000011B3F                 mov     rbx, [rsp+48h+arg_0]
.text:0000000000011B44                 mov     r12, [rsp+48h+var_8]
.text:0000000000011B49                 mov     rdi, [rsp+48h+arg_18]
.text:0000000000011B4E                 mov     rbp, [rsp+48h+arg_8]
.text:0000000000011B53                 add     rsp, 48h
.text:0000000000011B57                 retn
.text:0000000000011B57 sub_119F0       endp
.text:0000000000011B57
.text:0000000000011B57 ; ---------------------------------------------------------------------------
