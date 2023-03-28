.text:00000001400011A4
.text:00000001400011A4 ; =============== S U B R O U T I N E =======================================
.text:00000001400011A4
.text:00000001400011A4
.text:00000001400011A4 ; __int64 __fastcall DriverUnload(__int64)
.text:00000001400011A4 DriverUnload    proc near               ; DATA XREF: DriverEntry+2A↑o
.text:00000001400011A4
.text:00000001400011A4 var_18          = byte ptr -18h
.text:00000001400011A4
.text:00000001400011A4                 push    rbx
.text:00000001400011A6                 sub     rsp, 30h
.text:00000001400011AA                 mov     rax, [rcx+8]
.text:00000001400011AE                 lea     rdx, aDosdevicesAsmm ; "\\DosDevices\\ASMMAP64"
.text:00000001400011B5                 lea     rcx, [rsp+38h+var_18]
.text:00000001400011BA                 mov     rbx, [rax+40h]
.text:00000001400011BE                 call    cs:RtlInitUnicodeString
.text:00000001400011C4                 lea     rcx, [rsp+38h+var_18]
.text:00000001400011C9                 call    cs:IoDeleteSymbolicLink
.text:00000001400011CF                 mov     rcx, [rbx+8]
.text:00000001400011D3                 call    cs:IoDeleteDevice
.text:00000001400011D9                 add     rsp, 30h
.text:00000001400011DD                 pop     rbx
.text:00000001400011DE                 retn
.text:00000001400011DE DriverUnload    endp
.text:00000001400011DE
.text:00000001400011DE ; ---------------------------------------------------------------------------
.text:00000001400011DF                 align 20h