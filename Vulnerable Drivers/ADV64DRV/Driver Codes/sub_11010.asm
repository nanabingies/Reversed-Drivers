.text:0000000000011010
.text:0000000000011010 ; =============== S U B R O U T I N E =======================================
.text:0000000000011010
.text:0000000000011010
.text:0000000000011010 ; __int64 __fastcall sub_11010(__int64, IRP *)
.text:0000000000011010 sub_11010       proc near               ; DATA XREF: sub_11500+16↓o
.text:0000000000011010                                         ; .pdata:ExceptionDir↓o
.text:0000000000011010                 sub     rsp, 28h
.text:0000000000011014                 xor     ecx, ecx
.text:0000000000011016                 mov     rax, rdx
.text:0000000000011019                 mov     [rdx+38h], rcx
.text:000000000001101D                 mov     [rdx+30h], ecx
.text:0000000000011020                 xor     edx, edx        ; PriorityBoost
.text:0000000000011022                 mov     rcx, rax        ; Irp
.text:0000000000011025                 call    cs:IofCompleteRequest
.text:000000000001102B                 xor     eax, eax
.text:000000000001102D                 add     rsp, 28h
.text:0000000000011031                 retn
.text:0000000000011031 sub_11010       endp
.text:0000000000011031
.text:0000000000011031 ; ---------------------------------------------------------------------------
