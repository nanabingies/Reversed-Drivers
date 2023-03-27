.text:0000000000011040
.text:0000000000011040 ; =============== S U B R O U T I N E =======================================
.text:0000000000011040
.text:0000000000011040
.text:0000000000011040 ; __int64 __fastcall sub_11040(__int64, __int64, __int64)
.text:0000000000011040 sub_11040       proc near               ; CODE XREF: sub_11460+68↓p
.text:0000000000011040                                         ; DATA XREF: .rdata:0000000000012110↓o ...
.text:0000000000011040
.text:0000000000011040 var_38          = qword ptr -38h
.text:0000000000011040 PhysicalAddress = PHYSICAL_ADDRESS ptr -28h
.text:0000000000011040 var_18          = qword ptr -18h
.text:0000000000011040 var_10          = qword ptr -10h
.text:0000000000011040 var_8           = qword ptr -8
.text:0000000000011040 arg_10          = dword ptr  18h
.text:0000000000011040 arg_18          = qword ptr  20h
.text:0000000000011040
.text:0000000000011040                 sub     rsp, 58h
.text:0000000000011044                 cmp     dword ptr [r8+10h], 10h ; # sizeof(input_buffer)
.text:0000000000011049                 mov     [rsp+58h+var_8], rbp ; # 0x1
.text:000000000001104E                 mov     [rsp+58h+arg_10], 0
.text:0000000000011056                 mov     rbp, rdx
.text:0000000000011059                 jb      loc_11152
.text:000000000001105F
.text:000000000001105F loc_1105F:                              ; DATA XREF: .rdata:0000000000012110↓o
.text:000000000001105F                                         ; .rdata:0000000000012128↓o ...
.text:000000000001105F                 mov     [rsp+58h+arg_18], rbx 
.text:0000000000011064                 mov     [rsp+58h+var_10], rsi 
.text:0000000000011069                 mov     rsi, [rdx+18h]  
.text:000000000001106D                 mov     ebx, [rsi+8]   
.text:0000000000011070                 test    ebx, ebx
.text:0000000000011072                 jnz     short loc_1108D
.text:0000000000011074                 mov     rbx, [rsp+58h+arg_18]
.text:0000000000011079                 mov     rsi, [rsp+58h+var_10]
.text:000000000001107E                 mov     eax, 0C000000Dh
.text:0000000000011083                 mov     rbp, [rsp+58h+var_8]
.text:0000000000011088                 add     rsp, 58h
.text:000000000001108C                 retn
.text:000000000001108D ; ---------------------------------------------------------------------------
.text:000000000001108D
.text:000000000001108D loc_1108D:                              ; CODE XREF: sub_11040+32↑j
.text:000000000001108D                                         ; DATA XREF: .pdata:0000000000014018↓o ...
.text:000000000001108D                 cmp     [r8+8], ebx
.text:0000000000011091                 jb      loc_11139
.text:0000000000011097                 mov     eax, [rsi]
.text:0000000000011099                 xor     edx, edx
.text:000000000001109B                 lea     r9, [rsp+58h+arg_10]
.text:00000000000110A0                 mov     dword ptr [rsp+58h+PhysicalAddress], eax
.text:00000000000110A4                 mov     rax, [rsi]
.text:00000000000110A7                 lea     ecx, [rdx+1]
.text:00000000000110AA                 shr     rax, 20h
.text:00000000000110AE                 mov     dword ptr [rsp+58h+PhysicalAddress+4], eax
.text:00000000000110B2                 mov     r8, qword ptr [rsp+58h+PhysicalAddress]
.text:00000000000110B7                 lea     rax, [rsp+58h+PhysicalAddress]
.text:00000000000110BC                 mov     [rsp+58h+var_38], rax
.text:00000000000110C1                 call    cs:HalTranslateBusAddress 
.text:00000000000110C7                 test    al, al
.text:00000000000110C9                 jnz     short loc_110E4
.text:00000000000110CB                 mov     rbx, [rsp+58h+arg_18]
.text:00000000000110D0                 mov     rsi, [rsp+58h+var_10]
.text:00000000000110D5                 mov     eax, 107h
.text:00000000000110DA                 mov     rbp, [rsp+58h+var_8]
.text:00000000000110DF                 add     rsp, 58h
.text:00000000000110E3                 retn
.text:00000000000110E4 ; ---------------------------------------------------------------------------
.text:00000000000110E4
.text:00000000000110E4 loc_110E4:                              ; CODE XREF: sub_11040+89↑j
.text:00000000000110E4                                         ; DATA XREF: .pdata:0000000000014024↓o ...
.text:00000000000110E4                 mov     rcx, qword ptr [rsp+58h+PhysicalAddress] 
.text:00000000000110E9                 xor     r8d, r8d        ; CacheType
.text:00000000000110EC                 mov     rdx, rbx        ; NumberOfBytes
.text:00000000000110EF                 mov     [rsp+58h+var_18], rdi
.text:00000000000110F4                 mov     rdi, rbx
.text:00000000000110F7                 call    cs:MmMapIoSpace
.text:00000000000110FD                 mov     r8, rdi         ; Size
.text:0000000000011100                 mov     rcx, rsi        ; Dst
.text:0000000000011103                 mov     rdx, rax        ; Src
.text:0000000000011106                 mov     rbx, rax
.text:0000000000011109                 call    memmove
.text:000000000001110E                 mov     rdx, rdi        ; NumberOfBytes
.text:0000000000011111                 mov     rcx, rbx        ; BaseAddress
.text:0000000000011114                 call    cs:MmUnmapIoSpace
.text:000000000001111A                 mov     rbx, [rsp+58h+arg_18]
.text:000000000001111F                 mov     rsi, [rsp+58h+var_10]
.text:0000000000011124                 mov     [rbp+38h], rdi
.text:0000000000011128                 mov     rdi, [rsp+58h+var_18]
.text:000000000001112D                 xor     eax, eax
.text:000000000001112F                 mov     rbp, [rsp+58h+var_8]
.text:0000000000011134                 add     rsp, 58h
.text:0000000000011138                 retn
.text:0000000000011139 ; ---------------------------------------------------------------------------
.text:0000000000011139
.text:0000000000011139 loc_11139:                              ; CODE XREF: sub_11040+51↑j
.text:0000000000011139                                         ; DATA XREF: .pdata:0000000000014030↓o ...
.text:0000000000011139                 mov     rbx, [rsp+58h+arg_18]
.text:000000000001113E                 mov     rsi, [rsp+58h+var_10]
.text:0000000000011143                 mov     eax, 0C0000023h
.text:0000000000011148                 mov     rbp, [rsp+58h+var_8]
.text:000000000001114D                 add     rsp, 58h
.text:0000000000011151                 retn
.text:0000000000011152 ; ---------------------------------------------------------------------------
.text:0000000000011152
.text:0000000000011152 loc_11152:                              ; CODE XREF: sub_11040+19↑j
.text:0000000000011152                                         ; DATA XREF: .pdata:000000000001403C↓o ...
.text:0000000000011152                 mov     eax, 0C0000023h
.text:0000000000011157                 mov     rbp, [rsp+58h+var_8]
.text:000000000001115C                 add     rsp, 58h
.text:0000000000011160                 retn
.text:0000000000011160 sub_11040       endp
.text:0000000000011160
.text:0000000000011160 ; ---------------------------------------------------------------------------
