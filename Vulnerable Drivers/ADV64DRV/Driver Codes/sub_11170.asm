.text:0000000000011170
.text:0000000000011170 ; =============== S U B R O U T I N E =======================================
.text:0000000000011170
.text:0000000000011170
.text:0000000000011170 ; NTSTATUS __fastcall sub_11170(PVOID DriverObject, PDEVICE_OBJECT *DeviceObject)
.text:0000000000011170 sub_11170       proc near               ; CODE XREF: sub_11500+D↓p
.text:0000000000011170                                         ; DATA XREF: .pdata:0000000000014054↓o
.text:0000000000011170
.text:0000000000011170 DeviceCharacteristics= dword ptr -1A8h
.text:0000000000011170 Exclusive       = byte ptr -1A0h
.text:0000000000011170 DeviceObject    = qword ptr -198h
.text:0000000000011170 DestinationString= UNICODE_STRING ptr -188h
.text:0000000000011170 Destination     = UNICODE_STRING ptr -178h
.text:0000000000011170 SourceString    = word ptr -168h
.text:0000000000011170 var_C8          = word ptr -0C8h
.text:0000000000011170 var_28          = qword ptr -28h
.text:0000000000011170 var_18          = qword ptr -18h
.text:0000000000011170 var_10          = qword ptr -10h
.text:0000000000011170 var_8           = qword ptr -8
.text:0000000000011170 arg_10          = qword ptr  18h
.text:0000000000011170 arg_18          = qword ptr  20h
.text:0000000000011170
.text:0000000000011170                 mov     r11, rsp
.text:0000000000011173                 sub     rsp, 1C8h
.text:000000000001117A                 mov     rax, cs:BugCheckParameter2
.text:0000000000011181                 mov     [rsp+1C8h+var_28], rax
.text:0000000000011189                 mov     [r11+18h], rbx
.text:000000000001118D                 mov     [r11+20h], rbp
.text:0000000000011191                 mov     [r11-8], rsi
.text:0000000000011195                 mov     rbp, rcx
.text:0000000000011198                 mov     rbx, rdx
.text:000000000001119B                 mov     [r11-10h], rdi
.text:000000000001119F                 lea     rcx, [rsp+1C8h+DestinationString] ; DestinationString
.text:00000000000111A4                 lea     rdx, [rsp+1C8h+SourceString] ; SourceString
.text:00000000000111A9                 mov     [r11-18h], r12
.text:00000000000111AD                 mov     [rsp+1C8h+SourceString], 0
.text:00000000000111B4                 call    cs:RtlInitUnicodeString
.text:00000000000111BA                 lea     rdx, Source     ; "\\Device\\"
.text:00000000000111C1                 lea     rcx, [rsp+1C8h+DestinationString] ; Destination
.text:00000000000111C6                 mov     [rsp+1C8h+DestinationString.MaximumLength], 0A0h ; ' '
.text:00000000000111CD                 call    cs:RtlAppendUnicodeToString
.text:00000000000111D3                 lea     rdx, aAdv64drv  ; "ADV64DRV"
.text:00000000000111DA                 lea     rcx, [rsp+1C8h+DestinationString] ; Destination
.text:00000000000111DF                 call    cs:RtlAppendUnicodeToString
.text:00000000000111E5                 xor     r12d, r12d
.text:00000000000111E8                 mov     [rsp+1C8h+DeviceObject], rbx ; DeviceObject
.text:00000000000111ED                 lea     r8, [rsp+1C8h+DestinationString] ; DeviceName
.text:00000000000111F2                 lea     r9d, [r12+22h]  ; DeviceType
.text:00000000000111F7                 lea     edx, [r12+18h]  ; DeviceExtensionSize
.text:00000000000111FC                 mov     rcx, rbp        ; DriverObject
.text:00000000000111FF                 mov     [rsp+1C8h+Exclusive], 0 ; Exclusive
.text:0000000000011204                 mov     [rsp+1C8h+DeviceCharacteristics], r12d ; DeviceCharacteristics
.text:0000000000011209                 call    cs:IoCreateDevice
.text:000000000001120F                 test    eax, eax
.text:0000000000011211                 mov     esi, eax
.text:0000000000011213                 jns     short loc_11285
.text:0000000000011215                 mov     rbx, cs:qword_120A0
.text:000000000001121C                 xor     di, di
.text:000000000001121F                 mov     r8d, 8
.text:0000000000011225                 mov     rdx, rbx
.text:0000000000011228                 shr     rdx, 20h
.text:000000000001122C                 cmovnz  di, r8w
.text:0000000000011231                 test    edx, edx
.text:0000000000011233                 jz      short loc_11239
.text:0000000000011235                 add     di, r8w
.text:0000000000011239
.text:0000000000011239 loc_11239:                              ; CODE XREF: sub_11170+C3↑j
.text:0000000000011239                 lea     edx, [rdi+30h]  ; EntrySize
.text:000000000001123C                 mov     rcx, rbp        ; IoObject
.text:000000000001123F                 call    cs:IoAllocateErrorLogEntry
.text:0000000000011245                 test    rax, rax
.text:0000000000011248                 jz      loc_11385
.text:000000000001124E                 test    di, di
.text:0000000000011251                 mov     dword ptr [rax+0Ch], 0C4F80002h
.text:0000000000011258                 mov     [rax+18h], r12d
.text:000000000001125C                 mov     [rax], r12b
.text:000000000001125F                 mov     [rax+1], r12b
.text:0000000000011263                 mov     dword ptr [rax+10h], 2
.text:000000000001126A                 mov     [rax+14h], r12d
.text:000000000001126E                 mov     [rax+2], di
.text:0000000000011272                 jz      loc_1137C
.text:0000000000011278                 mov     [rax+28h], rbx
.text:000000000001127C                 cmp     di, 8
.text:0000000000011280                 jmp     loc_11376
.text:0000000000011285 ; ---------------------------------------------------------------------------
.text:0000000000011285
.text:0000000000011285 loc_11285:                              ; CODE XREF: sub_11170+A3↑j
.text:0000000000011285                 mov     rax, [rbx]
.text:0000000000011288                 lea     rdx, [rsp+1C8h+var_C8] ; SourceString
.text:0000000000011290                 mov     rcx, [rax+40h]
.text:0000000000011294                 xor     eax, eax
.text:0000000000011296                 mov     [rcx], rax
.text:0000000000011299                 mov     [rcx+8], rax
.text:000000000001129D                 mov     [rcx+10h], rax
.text:00000000000112A1                 mov     rax, [rbx]
.text:00000000000112A4                 mov     [rcx], rax
.text:00000000000112A7                 mov     rax, [rbx]
.text:00000000000112AA                 lea     rcx, [rsp+1C8h+Destination] ; DestinationString
.text:00000000000112AF                 mov     [rax+8], rbp
.text:00000000000112B3                 mov     [rsp+1C8h+var_C8], r12w
.text:00000000000112BC                 call    cs:RtlInitUnicodeString
.text:00000000000112C2                 lea     rdx, aDosdevices ; "\\DosDevices\\"
.text:00000000000112C9                 lea     rcx, [rsp+1C8h+Destination] ; Destination
.text:00000000000112CE                 mov     [rsp+1C8h+Destination.MaximumLength], 0A0h ; ' '
.text:00000000000112D5                 call    cs:RtlAppendUnicodeToString
.text:00000000000112DB                 lea     rdx, aAdv64drv  ; "ADV64DRV"
.text:00000000000112E2                 lea     rcx, [rsp+1C8h+Destination] ; Destination
.text:00000000000112E7                 call    cs:RtlAppendUnicodeToString
.text:00000000000112ED                 lea     rdx, [rsp+1C8h+DestinationString] ; DeviceName
.text:00000000000112F2                 lea     rcx, [rsp+1C8h+Destination] ; SymbolicLinkName
.text:00000000000112F7                 call    cs:IoCreateSymbolicLink
.text:00000000000112FD                 test    eax, eax
.text:00000000000112FF                 mov     esi, eax
.text:0000000000011301                 jns     loc_11387
.text:0000000000011307                 mov     rcx, [rbx]      ; DeviceObject
.text:000000000001130A                 call    cs:IoDeleteDevice
.text:0000000000011310                 xor     di, di
.text:0000000000011313                 mov     [rbx], r12
.text:0000000000011316                 mov     rbx, cs:qword_120A0
.text:000000000001131D                 mov     r8d, 8
.text:0000000000011323                 mov     rcx, rbx
.text:0000000000011326                 shr     rcx, 20h
.text:000000000001132A                 cmovnz  di, r8w
.text:000000000001132F                 test    ecx, ecx
.text:0000000000011331                 jz      short loc_11337
.text:0000000000011333                 add     di, r8w
.text:0000000000011337
.text:0000000000011337 loc_11337:                              ; CODE XREF: sub_11170+1C1↑j
.text:0000000000011337                 lea     edx, [rdi+30h]  ; EntrySize
.text:000000000001133A                 mov     rcx, rbp        ; IoObject
.text:000000000001133D                 call    cs:IoAllocateErrorLogEntry
.text:0000000000011343                 test    rax, rax
.text:0000000000011346                 jz      short loc_11385
.text:0000000000011348                 test    di, di
.text:000000000001134B                 mov     dword ptr [rax+0Ch], 0C4F80003h
.text:0000000000011352                 mov     [rax+18h], r12d
.text:0000000000011356                 mov     [rax], r12b
.text:0000000000011359                 mov     [rax+1], r12b
.text:000000000001135D                 mov     dword ptr [rax+10h], 5
.text:0000000000011364                 mov     [rax+14h], r12d
.text:0000000000011368                 mov     [rax+2], di
.text:000000000001136C                 jz      short loc_1137C
.text:000000000001136E                 mov     [rax+28h], rbx
.text:0000000000011372                 cmp     di, 8
.text:0000000000011376
.text:0000000000011376 loc_11376:                              ; CODE XREF: sub_11170+110↑j
.text:0000000000011376                 jbe     short loc_1137C
.text:0000000000011378                 mov     [rax+30h], rbx
.text:000000000001137C
.text:000000000001137C loc_1137C:                              ; CODE XREF: sub_11170+102↑j
.text:000000000001137C                                         ; sub_11170+1FC↑j ...
.text:000000000001137C                 mov     rcx, rax        ; ElEntry
.text:000000000001137F                 call    cs:IoWriteErrorLogEntry
.text:0000000000011385
.text:0000000000011385 loc_11385:                              ; CODE XREF: sub_11170+D8↑j
.text:0000000000011385                                         ; sub_11170+1D6↑j
.text:0000000000011385                 mov     eax, esi
.text:0000000000011387
.text:0000000000011387 loc_11387:                              ; CODE XREF: sub_11170+191↑j
.text:0000000000011387                 mov     r12, [rsp+1C8h+var_18]
.text:000000000001138F                 mov     rdi, [rsp+1C8h+var_10]
.text:0000000000011397                 mov     rsi, [rsp+1C8h+var_8]
.text:000000000001139F                 mov     rbp, [rsp+1C8h+arg_18]
.text:00000000000113A7                 mov     rbx, [rsp+1C8h+arg_10]
.text:00000000000113AF                 mov     rcx, [rsp+1C8h+var_28]
.text:00000000000113B7                 call    __security_check_cookie
.text:00000000000113BC                 add     rsp, 1C8h
.text:00000000000113C3                 retn
.text:00000000000113C3 sub_11170       endp
.text:00000000000113C3
.text:00000000000113C3 ; ---------------------------------------------------------------------------
