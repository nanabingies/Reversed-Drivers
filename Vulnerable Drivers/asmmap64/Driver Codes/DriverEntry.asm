.text:0000000140001000
.text:0000000140001000                 .686p
.text:0000000140001000                 .mmx
.text:0000000140001000                 .model flat
.text:0000000140001000
.text:0000000140001000 ; ===========================================================================
.text:0000000140001000
.text:0000000140001000 ; Segment type: Pure code
.text:0000000140001000 ; Segment permissions: Read/Execute
.text:0000000140001000 _text           segment para public 'CODE' use64
.text:0000000140001000                 assume cs:_text
.text:0000000140001000                 ;org 140001000h
.text:0000000140001000                 assume es:nothing, ss:nothing, ds:_data, fs:nothing, gs:nothing
.text:0000000140001000
.text:0000000140001000 ; =============== S U B R O U T I N E =======================================
.text:0000000140001000
.text:0000000140001000
.text:0000000140001000 ; __int64 __fastcall DriverEntry(_QWORD *)
.text:0000000140001000 DriverEntry     proc near               ; CODE XREF: start+25↓j
.text:0000000140001000
.text:0000000140001000 arg_0           = qword ptr  8
.text:0000000140001000
.text:0000000140001000                 sub     rsp, 28h
.text:0000000140001004                 lea     rax, DefaultIoctl
.text:000000014000100B                 mov     r8, rcx         ; # DriverObject
.text:000000014000100E                 mov     [rcx+70h], rax
.text:0000000140001012                 lea     r9, [rsp+28h+arg_0]
.text:0000000140001017                 mov     [rcx+80h], rax
.text:000000014000101E                 mov     edx, 9C40h
.text:0000000140001023                 mov     [rcx+0E0h], rax
.text:000000014000102A                 lea     rax, DriverUnload
.text:0000000140001031                 mov     [rcx+68h], rax
.text:0000000140001035                 lea     rcx, aDeviceAsmmap64 ; "\\Device\\ASMMAP64"
.text:000000014000103C                 call    Fn_CreateDevice
.text:0000000140001041                 test    eax, eax
.text:0000000140001043                 js      short loc_140001058
.text:0000000140001045                 mov     rcx, [rsp+28h+arg_0]
.text:000000014000104A                 mov     rdx, [rcx+40h]
.text:000000014000104E                 mov     [rdx+8], rcx
.text:0000000140001052                 mov     dword ptr [rdx], 9C40h
.text:0000000140001058
.text:0000000140001058 loc_140001058:                          ; CODE XREF: DriverEntry+43↑j
.text:0000000140001058                 add     rsp, 28h
.text:000000014000105C                 retn
.text:000000014000105C DriverEntry     endp
.text:000000014000105C
.text:000000014000105C ; ---------------------------------------------------------------------------