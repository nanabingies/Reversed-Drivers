.text:00000000000110A0
.text:00000000000110A0 ; =============== S U B R O U T I N E =======================================
.text:00000000000110A0
.text:00000000000110A0
.text:00000000000110A0 ; __int64 __fastcall VulnFunc(unsigned int *)
.text:00000000000110A0 VulnFunc        proc near               ; CODE XREF: DeviceIoControl+DD↓p
.text:00000000000110A0
.text:00000000000110A0 var_38          = qword ptr -38h
.text:00000000000110A0 var_28          = qword ptr -28h
.text:00000000000110A0 var_20          = qword ptr -20h
.text:00000000000110A0 var_18          = qword ptr -18h
.text:00000000000110A0 var_10          = qword ptr -10h
.text:00000000000110A0 arg_0           = dword ptr  8
.text:00000000000110A0 arg_8           = qword ptr  10h
.text:00000000000110A0 arg_10          = qword ptr  18h
.text:00000000000110A0 arg_18          = qword ptr  20h
.text:00000000000110A0
.text:00000000000110A0                 mov     r11, rsp
.text:00000000000110A3                 sub     rsp, 58h
.text:00000000000110A7                 mov     eax, [rcx+4]
.text:00000000000110AA                 mov     [r11+10h], rbx
.text:00000000000110AE                 mov     [r11+18h], rsi
.text:00000000000110B2                 mov     [r11+20h], rdi
.text:00000000000110B6                 mov     rdi, rcx
.text:00000000000110B9                 mov     ecx, [rcx+8]
.text:00000000000110BC                 test    ecx, ecx
.text:00000000000110BE                 mov     [rsp+58h+arg_0], eax
.text:00000000000110C2                 jz      loc_111DF
.text:00000000000110C8                 dec     ecx
.text:00000000000110CA                 jz      loc_11156
.text:00000000000110D0                 dec     ecx
.text:00000000000110D2                 jnz     loc_11272
.text:00000000000110D8                 mov     eax, [rdi]
.text:00000000000110DA                 lea     esi, [rcx+4]
.text:00000000000110DD                 xor     ebx, ebx
.text:00000000000110DF                 mov     dword ptr [rsp+58h+var_28], eax
.text:00000000000110E3                 lea     rax, [r11-20h]
.text:00000000000110E7                 mov     dword ptr [rsp+58h+var_28+4], ebx
.text:00000000000110EB                 mov     r8, [r11-28h]
.text:00000000000110EF                 lea     r9, [r11+8]
.text:00000000000110F3                 lea     ecx, [rsi-3]
.text:00000000000110F6                 xor     edx, edx
.text:00000000000110F8                 mov     [r11-38h], rax
.text:00000000000110FC                 call    cs:HalTranslateBusAddress
.text:0000000000011102                 test    al, al
.text:0000000000011104                 jz      loc_11212
.text:000000000001110A                 cmp     [rsp+58h+arg_0], ebx
.text:000000000001110E                 jz      short loc_1111A
.text:0000000000011110                 mov     eax, dword ptr [rsp+58h+var_20]
.text:0000000000011114                 mov     dword ptr [rsp+58h+var_28], eax
.text:0000000000011118                 jmp     short loc_11130
.text:000000000001111A ; ---------------------------------------------------------------------------
.text:000000000001111A
.text:000000000001111A loc_1111A:                              ; CODE XREF: VulnFunc+6E↑j
.text:000000000001111A                 mov     rcx, [rsp+58h+var_20]
.text:000000000001111F                 xor     r8d, r8d
.text:0000000000011122                 mov     rdx, rsi
.text:0000000000011125                 call    cs:MmMapIoSpace
.text:000000000001112B                 mov     [rsp+58h+var_28], rax
.text:0000000000011130
.text:0000000000011130 loc_11130:                              ; CODE XREF: VulnFunc+78↑j
.text:0000000000011130                 cmp     [rsp+58h+arg_0], ebx
.text:0000000000011134                 mov     [rdi+0Ch], ebx
.text:0000000000011137                 jz      short loc_11147
.text:0000000000011139                 movzx   edx, word ptr [rsp+58h+var_28]
.text:000000000001113E                 in      eax, dx
.text:000000000001113F                 mov     [rdi+0Ch], eax
.text:0000000000011142                 jmp     loc_1127E
.text:0000000000011147 ; ---------------------------------------------------------------------------
.text:0000000000011147
.text:0000000000011147 loc_11147:                              ; CODE XREF: VulnFunc+97↑j
.text:0000000000011147                 mov     rax, [rsp+58h+var_28]
.text:000000000001114C                 mov     eax, [rax]
.text:000000000001114E                 mov     [rdi+0Ch], eax
.text:0000000000011151                 jmp     loc_1127E
.text:0000000000011156 ; ---------------------------------------------------------------------------
.text:0000000000011156
.text:0000000000011156 loc_11156:                              ; CODE XREF: VulnFunc+2A↑j
.text:0000000000011156                 mov     eax, [rdi]
.text:0000000000011158                 xor     ebx, ebx
.text:000000000001115A                 mov     esi, 2
.text:000000000001115F                 mov     dword ptr [rsp+58h+var_20], eax
.text:0000000000011163                 lea     rax, [rsp+58h+var_18]
.text:0000000000011168                 mov     dword ptr [rsp+58h+var_20+4], ebx
.text:000000000001116C                 mov     r8, [rsp+58h+var_20]
.text:0000000000011171                 lea     r9, [rsp+58h+arg_0]
.text:0000000000011176                 lea     ecx, [rsi-1]
.text:0000000000011179                 xor     edx, edx
.text:000000000001117B                 mov     [rsp+58h+var_38], rax
.text:0000000000011180                 call    cs:HalTranslateBusAddress
.text:0000000000011186                 test    al, al
.text:0000000000011188                 jz      loc_11212
.text:000000000001118E                 cmp     [rsp+58h+arg_0], ebx
.text:0000000000011192                 jz      short loc_1119E
.text:0000000000011194                 mov     eax, dword ptr [rsp+58h+var_18]
.text:0000000000011198                 mov     dword ptr [rsp+58h+var_28], eax
.text:000000000001119C                 jmp     short loc_111B4
.text:000000000001119E ; ---------------------------------------------------------------------------
.text:000000000001119E
.text:000000000001119E loc_1119E:                              ; CODE XREF: VulnFunc+F2↑j
.text:000000000001119E                 mov     rcx, [rsp+58h+var_18]
.text:00000000000111A3                 xor     r8d, r8d
.text:00000000000111A6                 mov     rdx, rsi
.text:00000000000111A9                 call    cs:MmMapIoSpace
.text:00000000000111AF                 mov     [rsp+58h+var_28], rax
.text:00000000000111B4
.text:00000000000111B4 loc_111B4:                              ; CODE XREF: VulnFunc+FC↑j
.text:00000000000111B4                 cmp     [rsp+58h+arg_0], ebx
.text:00000000000111B8                 mov     [rdi+0Ch], bx
.text:00000000000111BC                 jz      short loc_111CE
.text:00000000000111BE                 movzx   edx, word ptr [rsp+58h+var_28]
.text:00000000000111C3                 in      ax, dx
.text:00000000000111C5                 mov     [rdi+0Ch], ax
.text:00000000000111C9                 jmp     loc_1127E
.text:00000000000111CE ; ---------------------------------------------------------------------------
.text:00000000000111CE
.text:00000000000111CE loc_111CE:                              ; CODE XREF: VulnFunc+11C↑j
.text:00000000000111CE                 mov     rax, [rsp+58h+var_28]
.text:00000000000111D3                 movzx   eax, word ptr [rax]
.text:00000000000111D6                 mov     [rdi+0Ch], ax
.text:00000000000111DA                 jmp     loc_1127E
.text:00000000000111DF ; ---------------------------------------------------------------------------
.text:00000000000111DF
.text:00000000000111DF loc_111DF:                              ; CODE XREF: VulnFunc+22↑j
.text:00000000000111DF                 mov     eax, [rdi]
.text:00000000000111E1                 xor     ebx, ebx
.text:00000000000111E3                 mov     esi, 1
.text:00000000000111E8                 mov     dword ptr [rsp+58h+var_18], eax
.text:00000000000111EC                 lea     rax, [rsp+58h+var_10]
.text:00000000000111F1                 mov     dword ptr [rsp+58h+var_18+4], ebx
.text:00000000000111F5                 mov     r8, [rsp+58h+var_18]
.text:00000000000111FA                 lea     r9, [rsp+58h+arg_0]
.text:00000000000111FF                 xor     edx, edx
.text:0000000000011201                 mov     ecx, esi
.text:0000000000011203                 mov     [rsp+58h+var_38], rax
.text:0000000000011208                 call    cs:HalTranslateBusAddress
.text:000000000001120E                 test    al, al
.text:0000000000011210                 jnz     short loc_1122B
.text:0000000000011212
.text:0000000000011212 loc_11212:                              ; CODE XREF: VulnFunc+64↑j
.text:0000000000011212                                         ; VulnFunc+E8↑j
.text:0000000000011212                 mov     eax, 0C000002Eh
.text:0000000000011217                 mov     rdi, [rsp+58h+arg_18]
.text:000000000001121C                 mov     rsi, [rsp+58h+arg_10]
.text:0000000000011221                 mov     rbx, [rsp+58h+arg_8]
.text:0000000000011226                 add     rsp, 58h
.text:000000000001122A                 retn
.text:000000000001122B ; ---------------------------------------------------------------------------
.text:000000000001122B
.text:000000000001122B loc_1122B:                              ; CODE XREF: VulnFunc+170↑j
.text:000000000001122B                 cmp     [rsp+58h+arg_0], ebx
.text:000000000001122F                 jz      short loc_1123B
.text:0000000000011231                 mov     eax, dword ptr [rsp+58h+var_10]
.text:0000000000011235                 mov     dword ptr [rsp+58h+var_28], eax
.text:0000000000011239                 jmp     short loc_11251
.text:000000000001123B ; ---------------------------------------------------------------------------
.text:000000000001123B
.text:000000000001123B loc_1123B:                              ; CODE XREF: VulnFunc+18F↑j
.text:000000000001123B                 mov     rcx, [rsp+58h+var_10]
.text:0000000000011240                 xor     r8d, r8d
.text:0000000000011243                 mov     rdx, rsi
.text:0000000000011246                 call    cs:MmMapIoSpace
.text:000000000001124C                 mov     [rsp+58h+var_28], rax
.text:0000000000011251
.text:0000000000011251 loc_11251:                              ; CODE XREF: VulnFunc+199↑j
.text:0000000000011251                 cmp     [rsp+58h+arg_0], ebx
.text:0000000000011255                 mov     [rdi+0Ch], bl
.text:0000000000011258                 jz      short loc_11265
.text:000000000001125A                 movzx   edx, word ptr [rsp+58h+var_28]
.text:000000000001125F                 in      al, dx
.text:0000000000011260                 mov     [rdi+0Ch], al
.text:0000000000011263                 jmp     short loc_1127E
.text:0000000000011265 ; ---------------------------------------------------------------------------
.text:0000000000011265
.text:0000000000011265 loc_11265:                              ; CODE XREF: VulnFunc+1B8↑j
.text:0000000000011265                 mov     rax, [rsp+58h+var_28]
.text:000000000001126A                 movzx   eax, byte ptr [rax]
.text:000000000001126D                 mov     [rdi+0Ch], al
.text:0000000000011270                 jmp     short loc_1127E
.text:0000000000011272 ; ---------------------------------------------------------------------------
.text:0000000000011272
.text:0000000000011272 loc_11272:                              ; CODE XREF: VulnFunc+32↑j
.text:0000000000011272                 mov     ebx, [rsp+58h+arg_0]
.text:0000000000011276                 test    ebx, ebx
.text:0000000000011278                 jnz     short loc_11292
.text:000000000001127A                 mov     esi, [rsp+58h+arg_0]
.text:000000000001127E
.text:000000000001127E loc_1127E:                              ; CODE XREF: VulnFunc+A2↑j
.text:000000000001127E                                         ; VulnFunc+B1↑j ...
.text:000000000001127E                 cmp     [rsp+58h+arg_0], 0
.text:0000000000011283                 jnz     short loc_11292
.text:0000000000011285                 mov     rcx, [rsp+58h+var_28]
.text:000000000001128A                 mov     edx, esi
.text:000000000001128C                 call    cs:MmUnmapIoSpace
.text:0000000000011292
.text:0000000000011292 loc_11292:                              ; CODE XREF: VulnFunc+1D8↑j
.text:0000000000011292                                         ; VulnFunc+1E3↑j
.text:0000000000011292                 mov     rdi, [rsp+58h+arg_18]
.text:0000000000011297                 mov     rsi, [rsp+58h+arg_10]
.text:000000000001129C                 mov     eax, ebx
.text:000000000001129E                 mov     rbx, [rsp+58h+arg_8]
.text:00000000000112A3                 add     rsp, 58h
.text:00000000000112A7                 retn
.text:00000000000112A7 VulnFunc        endp
.text:00000000000112A7
.text:00000000000112A7 ; ---------------------------------------------------------------------------