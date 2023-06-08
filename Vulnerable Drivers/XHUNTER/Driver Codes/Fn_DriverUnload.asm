.text:0000000140004118
.text:0000000140004118 ; =============== S U B R O U T I N E =======================================
.text:0000000140004118
.text:0000000140004118
.text:0000000140004118 ; __int64 __fastcall Fn_DriverUnload(__int64)
.text:0000000140004118 Fn_DriverUnload proc near               ; DATA XREF: DriverEntry:loc_140004011↑o
.text:0000000140004118                 push    rbx
.text:000000014000411A                 sub     rsp, 20h
.text:000000014000411E                 mov     rbx, rcx
.text:0000000140004121                 call    _guard_check_icall_nop
.text:0000000140004126                 call    Fn_RemoveCallbacks
.text:000000014000412B                 call    _guard_check_icall_nop
.text:0000000140004130                 lea     rcx, xmmword_14000A500
.text:0000000140004137                 call    cs:IoDeleteSymbolicLink
.text:000000014000413D                 lea     rcx, xmmword_14000A4F0
.text:0000000140004144                 call    sub_14000429C
.text:0000000140004149                 lea     rcx, xmmword_14000A500
.text:0000000140004150                 call    sub_14000429C
.text:0000000140004155                 mov     rcx, [rbx+8]
.text:0000000140004159                 add     rsp, 20h
.text:000000014000415D                 pop     rbx
.text:000000014000415E                 jmp     cs:IoDeleteDevice
.text:000000014000415E Fn_DriverUnload endp
.text:000000014000415E
.text:000000014000415E ; ---------------------------------------------------------------------------
