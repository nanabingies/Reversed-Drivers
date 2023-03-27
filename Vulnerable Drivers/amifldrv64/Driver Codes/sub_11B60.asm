.text:0000000000011B60
.text:0000000000011B60 ; =============== S U B R O U T I N E =======================================
.text:0000000000011B60
.text:0000000000011B60
.text:0000000000011B60 ; __int64 __fastcall sub_11B60(__int64 systemBuffer, _QWORD *devExt)
.text:0000000000011B60 sub_11B60       proc near               ; CODE XREF: DeviceIoControl+9F↓p
.text:0000000000011B60
.text:0000000000011B60 arg_10          = qword ptr  18h
.text:0000000000011B60 arg_18          = qword ptr  20h
.text:0000000000011B60
.text:0000000000011B60                 sub     rsp, 28h
.text:0000000000011B64                 mov     rcx, [rdx+8]    ; # devExt+0x8
.text:0000000000011B68                 mov     [rsp+28h+arg_10], rbx
.text:0000000000011B6D                 mov     rbx, [rdx+18h]
.text:0000000000011B71                 test    rcx, rcx
.text:0000000000011B74                 mov     [rsp+28h+arg_18], rdi
.text:0000000000011B79                 mov     rdi, [rdx+10h]
.text:0000000000011B7D                 jnz     short loc_11B89
.text:0000000000011B7F                 test    rbx, rbx
.text:0000000000011B82                 jnz     short loc_11B89
.text:0000000000011B84                 test    rdi, rdi
.text:0000000000011B87                 jz      short loc_11BA4
.text:0000000000011B89
.text:0000000000011B89 loc_11B89:                              ; CODE XREF: sub_11B60+1D↑j
.text:0000000000011B89                                         ; sub_11B60+22↑j
.text:0000000000011B89                 mov     rdx, rbx
.text:0000000000011B8C                 call    cs:MmUnmapLockedPages
.text:0000000000011B92                 mov     rcx, rbx
.text:0000000000011B95                 call    cs:IoFreeMdl
.text:0000000000011B9B                 mov     rcx, rdi
.text:0000000000011B9E                 call    cs:MmFreeContiguousMemory
.text:0000000000011BA4
.text:0000000000011BA4 loc_11BA4:                              ; CODE XREF: sub_11B60+27↑j
.text:0000000000011BA4                 mov     rdi, [rsp+28h+arg_18]
.text:0000000000011BA9                 mov     rbx, [rsp+28h+arg_10]
.text:0000000000011BAE                 xor     eax, eax
.text:0000000000011BB0                 add     rsp, 28h
.text:0000000000011BB4                 retn
.text:0000000000011BB4 sub_11B60       endp
.text:0000000000011BB4
.text:0000000000011BB4 ; ---------------------------------------------------------------------------