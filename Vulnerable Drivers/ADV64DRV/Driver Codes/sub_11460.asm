.text:0000000000011460
.text:0000000000011460 ; =============== S U B R O U T I N E =======================================
.text:0000000000011460
.text:0000000000011460
.text:0000000000011460 ; __int64 __fastcall sub_11460(__int64, __int64)
.text:0000000000011460 sub_11460       proc near               ; DATA XREF: sub_11500+28↓o
.text:0000000000011460                                         ; .pdata:000000000001406C↓o
.text:0000000000011460
.text:0000000000011460 arg_10          = qword ptr  18h
.text:0000000000011460 arg_18          = qword ptr  20h
.text:0000000000011460
.text:0000000000011460                 sub     rsp, 28h
.text:0000000000011464                 mov     r8, [rdx+0B8h]
.text:000000000001146B                 mov     [rsp+28h+arg_10], rbx
.text:0000000000011470                 mov     qword ptr [rdx+38h], 0
.text:0000000000011478                 cmp     byte ptr [r8], 0Eh
.text:000000000001147C                 mov     [rsp+28h+arg_18], rdi
.text:0000000000011481                 mov     ebx, 0C0000002h
.text:0000000000011486                 mov     rdi, rdx
.text:0000000000011489                 jnz     short loc_114D3
.text:000000000001148B                 mov     eax, [r8+18h]
.text:000000000001148F                 sub     eax, 224000h
.text:0000000000011494                 jz      short loc_114D1
.text:0000000000011496                 sub     eax, 4
.text:0000000000011499                 jz      short loc_114C4
.text:000000000001149B                 cmp     eax, 0Ch
.text:000000000001149E                 jnz     short loc_114D3
.text:00000000000114A0                 cmp     dword ptr [r8+8], 4
.text:00000000000114A5                 jb      short loc_114BD
.text:00000000000114A7                 mov     rax, [rdx+18h]
.text:00000000000114AB                 xor     ebx, ebx
.text:00000000000114AD                 mov     dword ptr [rax], 20000h
.text:00000000000114B3                 mov     qword ptr [rdx+38h], 4
.text:00000000000114BB                 jmp     short loc_114D3
.text:00000000000114BD ; ---------------------------------------------------------------------------
.text:00000000000114BD
.text:00000000000114BD loc_114BD:                              ; CODE XREF: sub_11460+45↑j
.text:00000000000114BD                 mov     ebx, 0C0000023h
.text:00000000000114C2                 jmp     short loc_114D3
.text:00000000000114C4 ; ---------------------------------------------------------------------------
.text:00000000000114C4
.text:00000000000114C4 loc_114C4:                              ; CODE XREF: sub_11460+39↑j
.text:00000000000114C4                 mov     rcx, [rcx+40h]
.text:00000000000114C8                 call    sub_11040
.text:00000000000114CD                 mov     ebx, eax
.text:00000000000114CF                 jmp     short loc_114D3
.text:00000000000114D1 ; ---------------------------------------------------------------------------
.text:00000000000114D1
.text:00000000000114D1 loc_114D1:                              ; CODE XREF: sub_11460+34↑j
.text:00000000000114D1                 xor     ebx, ebx
.text:00000000000114D3
.text:00000000000114D3 loc_114D3:                              ; CODE XREF: sub_11460+29↑j
.text:00000000000114D3                                         ; sub_11460+3E↑j ...
.text:00000000000114D3                 cmp     ebx, 103h
.text:00000000000114D9                 mov     [rdi+30h], ebx
.text:00000000000114DC                 jz      short loc_114E9
.text:00000000000114DE                 xor     edx, edx        ; PriorityBoost
.text:00000000000114E0                 mov     rcx, rdi        ; Irp
.text:00000000000114E3                 call    cs:IofCompleteRequest
.text:00000000000114E9
.text:00000000000114E9 loc_114E9:                              ; CODE XREF: sub_11460+7C↑j
.text:00000000000114E9                 mov     rdi, [rsp+28h+arg_18]
.text:00000000000114EE                 mov     eax, ebx
.text:00000000000114F0                 mov     rbx, [rsp+28h+arg_10]
.text:00000000000114F5                 add     rsp, 28h
.text:00000000000114F9                 retn
.text:00000000000114F9 sub_11460       endp
.text:00000000000114F9
.text:00000000000114F9 ; ---------------------------------------------------------------------------
     
