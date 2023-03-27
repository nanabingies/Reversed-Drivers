.text:00000000000113D0
.text:00000000000113D0 ; =============== S U B R O U T I N E =======================================
.text:00000000000113D0
.text:00000000000113D0
.text:00000000000113D0 ; void __fastcall sub_113D0(__int64)
.text:00000000000113D0 sub_113D0       proc near               ; DATA XREF: sub_11500+36↓o
.text:00000000000113D0                                         ; .pdata:0000000000014060↓o
.text:00000000000113D0
.text:00000000000113D0 DestinationString= UNICODE_STRING ptr -0C8h
.text:00000000000113D0 SourceString    = word ptr -0B8h
.text:00000000000113D0 var_18          = qword ptr -18h
.text:00000000000113D0
.text:00000000000113D0                 push    rbx
.text:00000000000113D2                 sub     rsp, 0E0h
.text:00000000000113D9                 mov     rax, cs:BugCheckParameter2
.text:00000000000113E0                 mov     [rsp+0E8h+var_18], rax
.text:00000000000113E8                 mov     rbx, [rcx+8]
.text:00000000000113EC                 lea     rdx, [rsp+0E8h+SourceString] ; SourceString
.text:00000000000113F1                 lea     rcx, [rsp+0E8h+DestinationString] ; DestinationString
.text:00000000000113F6                 mov     [rsp+0E8h+SourceString], 0
.text:00000000000113FD                 call    cs:RtlInitUnicodeString
.text:0000000000011403                 lea     rdx, aDosdevices ; "\\DosDevices\\"
.text:000000000001140A                 lea     rcx, [rsp+0E8h+DestinationString] ; Destination
.text:000000000001140F                 mov     [rsp+0E8h+DestinationString.MaximumLength], 0A0h ; ' '
.text:0000000000011416                 call    cs:RtlAppendUnicodeToString
.text:000000000001141C                 lea     rdx, aAdv64drv  ; "ADV64DRV"
.text:0000000000011423                 lea     rcx, [rsp+0E8h+DestinationString] ; Destination
.text:0000000000011428                 call    cs:RtlAppendUnicodeToString
.text:000000000001142E                 lea     rcx, [rsp+0E8h+DestinationString] ; SymbolicLinkName
.text:0000000000011433                 call    cs:IoDeleteSymbolicLink
.text:0000000000011439                 mov     rcx, rbx        ; DeviceObject
.text:000000000001143C                 call    cs:IoDeleteDevice
.text:0000000000011442                 mov     rcx, [rsp+0E8h+var_18]
.text:000000000001144A                 call    __security_check_cookie
.text:000000000001144F                 add     rsp, 0E0h
.text:0000000000011456                 pop     rbx
.text:0000000000011457                 retn
.text:0000000000011457 sub_113D0       endp
.text:0000000000011457
.text:0000000000011457 ; ---------------------------------------------------------------------------
