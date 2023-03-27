.text:0000000000011BC0 ; =============== S U B R O U T I N E =======================================
.text:0000000000011BC0
.text:0000000000011BC0 ; Attributes: library function
.text:0000000000011BC0
.text:0000000000011BC0 DriverUnload    proc near               ; DATA XREF: DriverEntry+BF↓o
.text:0000000000011BC0
.text:0000000000011BC0 var_18          = byte ptr -18h
.text:0000000000011BC0
.text:0000000000011BC0                 push    rbx
.text:0000000000011BC2                 sub     rsp, 30h
.text:0000000000011BC6                 mov     rbx, rcx        ; # DriverObject
.text:0000000000011BC9                 lea     rdx, aGenericdrv ; "\\??\\genericdrv"
.text:0000000000011BD0                 lea     rcx, [rsp+38h+var_18]
.text:0000000000011BD5                 call    cs:RtlInitUnicodeString
.text:0000000000011BDB                 lea     rcx, [rsp+38h+var_18]
.text:0000000000011BE0                 call    cs:IoDeleteSymbolicLink
.text:0000000000011BE6                 mov     rcx, [rbx+8]
.text:0000000000011BEA                 call    cs:IoDeleteDevice
.text:0000000000011BF0                 add     rsp, 30h
.text:0000000000011BF4                 pop     rbx
.text:0000000000011BF5                 retn
.text:0000000000011BF5 DriverUnload    endp
.text:0000000000011BF5
.text:0000000000011BF5 ; ---------------------------------------------------------------------------