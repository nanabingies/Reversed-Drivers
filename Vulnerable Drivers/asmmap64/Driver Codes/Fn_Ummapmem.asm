PAGE:0000000140006000
PAGE:0000000140006000 ; Segment type: Pure code
PAGE:0000000140006000 ; Segment permissions: Read/Execute
PAGE:0000000140006000 PAGE            segment para public 'CODE' use64
PAGE:0000000140006000                 assume cs:PAGE
PAGE:0000000140006000                 ;org 140006000h
PAGE:0000000140006000                 assume es:nothing, ss:nothing, ds:_data, fs:nothing, gs:nothing
PAGE:0000000140006000
PAGE:0000000140006000 ; =============== S U B R O U T I N E =======================================
PAGE:0000000140006000
PAGE:0000000140006000
PAGE:0000000140006000 ; __int64 __fastcall Fn_Ummapmem(__int64, __int64, __int64)
PAGE:0000000140006000 Fn_Ummapmem     proc near               ; CODE XREF: DefaultIoctl:loc_140001176↑p
PAGE:0000000140006000                 push    rbx
PAGE:0000000140006002                 sub     rsp, 20h
PAGE:0000000140006006                 mov     eax, [r8+10h]
PAGE:000000014000600A                 and     qword ptr [rdx+38h], 0
PAGE:000000014000600F                 mov     rcx, [rdx+18h]
PAGE:0000000140006013                 cmp     eax, 18h
PAGE:0000000140006016                 jz      short loc_14000602F
PAGE:0000000140006018                 lea     rcx, aUmmapmemInsuff ; "(UMMAPMEM) Insufficient input or output"...
PAGE:000000014000601F                 call    DbgPrint
PAGE:0000000140006024                 mov     eax, 0C000009Ah
PAGE:0000000140006029                 add     rsp, 20h
PAGE:000000014000602D                 pop     rbx
PAGE:000000014000602E                 retn
PAGE:000000014000602F ; ---------------------------------------------------------------------------
PAGE:000000014000602F
PAGE:000000014000602F loc_14000602F:                          ; CODE XREF: Fn_Ummapmem+16↑j
PAGE:000000014000602F                 mov     rbx, [rcx+8]
PAGE:0000000140006033                 mov     r8d, [rcx+0Ch]
PAGE:0000000140006037                 mov     r9d, ebx
PAGE:000000014000603A                 mov     rdx, rbx
PAGE:000000014000603D                 lea     rcx, aUmmapmemUnmapA ; "(UMMAPMEM) Unmap Addr %I64x [%x,%x]\n"
PAGE:0000000140006044                 call    DbgPrint
PAGE:0000000140006049                 mov     rdx, rbx
PAGE:000000014000604C                 or      rcx, 0FFFFFFFFFFFFFFFFh
PAGE:0000000140006050                 add     rsp, 20h
PAGE:0000000140006054                 pop     rbx
PAGE:0000000140006055                 jmp     cs:ZwUnmapViewOfSection
PAGE:0000000140006055 Fn_Ummapmem     endp
PAGE:0000000140006055