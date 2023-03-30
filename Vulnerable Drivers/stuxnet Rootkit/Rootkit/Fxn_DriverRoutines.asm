.text:00010300
.text:00010300 ; =============== S U B R O U T I N E =======================================
.text:00010300
.text:00010300 ; Attributes: bp-based frame
.text:00010300
.text:00010300 GetHaldllHandle proc near               ; CODE XREF: DriverReinitializationRoutine+29↓p
.text:00010300                                         ; DATA XREF: HEADER:0001011C↑o ...
.text:00010300
.text:00010300 var_18          = byte ptr -18h
.text:00010300 var_10          = byte ptr -10h
.text:00010300 var_C           = dword ptr -0Ch
.text:00010300 var_8           = dword ptr -8
.text:00010300 var_1           = byte ptr -1
.text:00010300
.text:00010300                 push    ebp
.text:00010301                 mov     ebp, esp
.text:00010303                 sub     esp, 18h
.text:00010306                 push    esi
.text:00010307                 push    edi
.text:00010308                 push    offset aSystemrootSyst ; "\\SystemRoot\\System32\\hal.dll"
.text:0001030D                 lea     eax, [ebp+var_18]
.text:00010310                 push    eax
.text:00010311                 call    ds:RtlInitUnicodeString
.text:00010317                 and     [ebp+var_8], 0
.text:0001031B                 lea     ecx, [ebp+var_18]
.text:0001031E                 lea     edi, [ebp+var_8]
.text:00010321                 lea     esi, [ebp+var_10]
.text:00010324                 call    GetHandle
.text:00010329                 cmp     [ebp+var_8], 0
.text:0001032D                 pop     edi
.text:0001032E                 setz    [ebp+var_1]
.text:00010332                 cmp     [ebp+var_10], 0
.text:00010336                 pop     esi
.text:00010337                 jz      short loc_10346
.text:00010339                 push    [ebp+var_C]
.text:0001033C                 mov     [ebp+var_10], 0
.text:00010340                 call    ds:ZwClose
.text:00010346
.text:00010346 loc_10346:                              ; CODE XREF: GetHaldllHandle+37↑j
.text:00010346                 mov     al, [ebp+var_1]
.text:00010349                 leave
.text:0001034A                 retn
.text:0001034A GetHaldllHandle endp
.text:0001034A
.text:0001034A ; ---------------------------------------------------------------------------


.text:0001061E ; =============== S U B R O U T I N E =======================================
.text:0001061E
.text:0001061E ; Attributes: bp-based frame
.text:0001061E
.text:0001061E GetHandle       proc near               ; CODE XREF: GetHaldllHandle+24↑p
.text:0001061E                                         ; sub_10672+14↓p
.text:0001061E
.text:0001061E var_20          = dword ptr -20h
.text:0001061E var_1C          = dword ptr -1Ch
.text:0001061E var_18          = dword ptr -18h
.text:0001061E var_14          = dword ptr -14h
.text:0001061E var_10          = dword ptr -10h
.text:0001061E var_C           = dword ptr -0Ch
.text:0001061E var_8           = byte ptr -8
.text:0001061E
.text:0001061E                 push    ebp
.text:0001061F                 mov     ebp, esp
.text:00010621                 sub     esp, 24h
.text:00010624                 push    ebx
.text:00010625                 xor     ebx, ebx
.text:00010627                 cmp     [edi], ebx
.text:00010629                 lea     eax, [esi+4]
.text:0001062C                 mov     [esi], bl
.text:0001062E                 mov     [eax], ebx
.text:00010630                 jnz     short loc_1066D
.text:00010632                 push    60h ; '`'
.text:00010634                 push    1
.text:00010636                 mov     [ebp+var_18], ecx
.text:00010639                 lea     ecx, [ebp+var_8]
.text:0001063C                 push    ecx
.text:0001063D                 lea     ecx, [ebp+var_20]
.text:00010640                 push    ecx
.text:00010641                 push    80100000h
.text:00010646                 push    eax
.text:00010647                 mov     [ebp+var_20], 18h
.text:0001064E                 mov     [ebp+var_1C], ebx
.text:00010651                 mov     [ebp+var_14], 240h
.text:00010658                 mov     [ebp+var_10], ebx
.text:0001065B                 mov     [ebp+var_C], ebx
.text:0001065E                 call    ds:ZwOpenFile
.text:00010664                 cmp     eax, ebx
.text:00010666                 mov     [edi], eax
.text:00010668                 setz    al
.text:0001066B                 mov     [esi], al
.text:0001066D
.text:0001066D loc_1066D:                              ; CODE XREF: GetHandle+12↑j
.text:0001066D                 mov     eax, esi
.text:0001066F                 pop     ebx
.text:00010670                 leave
.text:00010671                 retn
.text:00010671 GetHandle       endp
.text:00010671



.text:000108D2
.text:000108D2 ; =============== S U B R O U T I N E =======================================
.text:000108D2
.text:000108D2 ; Attributes: bp-based frame
.text:000108D2
.text:000108D2 RegisterImageCallback proc near         ; CODE XREF: DriverReinitializationRoutine:loc_10390↑p
.text:000108D2
.text:000108D2 var_8           = byte ptr -8
.text:000108D2 var_4           = dword ptr -4
.text:000108D2
.text:000108D2                 push    ebp
.text:000108D3                 mov     ebp, esp
.text:000108D5                 push    ecx
.text:000108D6                 push    ecx
.text:000108D7                 and     [ebp+var_4], 0
.text:000108DB                 push    esi
.text:000108DC                 push    edi
.text:000108DD                 lea     esi, [ebp+var_4]
.text:000108E0                 lea     edi, [ebp+var_8]
.text:000108E3                 call    sub_10922
.text:000108E8                 mov     eax, [ebp+var_4]
.text:000108EB                 test    eax, eax
.text:000108ED                 jnz     short loc_1091E
.text:000108EF                 lea     esi, [ebp+var_4]
.text:000108F2                 call    sub_1097A
.text:000108F7                 mov     eax, [ebp+var_4]
.text:000108FA                 call    sub_10A7A
.text:000108FF                 test    eax, eax
.text:00010901                 jnz     short loc_1091E
.text:00010903                 lea     esi, [ebp+var_8]
.text:00010906                 call    sub_109B6
.text:0001090B                 lea     esi, [ebp+var_8]
.text:0001090E                 call    sub_105A8
.text:00010913                 push    offset NotifyRoutine
.text:00010918                 call    ds:PsSetLoadImageNotifyRoutine
.text:0001091E
.text:0001091E loc_1091E:                              ; CODE XREF: RegisterImageCallback+1B↑j
.text:0001091E                                         ; RegisterImageCallback+2F↑j
.text:0001091E                 pop     edi
.text:0001091F                 pop     esi
.text:00010920                 leave
.text:00010921                 retn
.text:00010921 RegisterImageCallback endp
.text:00010921