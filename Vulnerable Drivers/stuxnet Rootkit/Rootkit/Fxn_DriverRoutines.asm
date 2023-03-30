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


.text:000104C8
.text:000104C8 ; =============== S U B R O U T I N E =======================================
.text:000104C8
.text:000104C8 ; Attributes: bp-based frame
.text:000104C8
.text:000104C8 sub_104C8       proc near               ; CODE XREF: sub_10580+C↓p
.text:000104C8
.text:000104C8 var_120         = dword ptr -120h
.text:000104C8 var_C           = word ptr -0Ch
.text:000104C8 var_4           = dword ptr -4
.text:000104C8 arg_0           = dword ptr  8
.text:000104C8
.text:000104C8                 push    ebp
.text:000104C9                 mov     ebp, esp
.text:000104CB                 sub     esp, 120h
.text:000104D1                 push    esi
.text:000104D2                 mov     esi, [ebp+arg_0]
.text:000104D5                 push    edi
.text:000104D6                 mov     byte ptr [esi], 1
.text:000104D9                 call    ds:KeGetCurrentIrql
.text:000104DF                 test    al, al
.text:000104E1                 jz      short loc_104EB
.text:000104E3                 mov     byte ptr [esi], 0
.text:000104E6                 jmp     loc_10578
.text:000104EB ; ---------------------------------------------------------------------------
.text:000104EB
.text:000104EB loc_104EB:                              ; CODE XREF: sub_104C8+19↑j
.text:000104EB                 lea     esi, [ebp+var_4]
.text:000104EE                 call    sub_105A8
.text:000104F3                 push    0
.text:000104F5                 call    Fxn_GetWindowsVersion
.text:000104FA                 test    al, al
.text:000104FC                 jnz     short loc_10578
.text:000104FE                 push    1
.text:00010500                 call    Fxn_GetWindowsVersion
.text:00010505                 test    al, al
.text:00010507                 jnz     short loc_10578
.text:00010509                 push    2
.text:0001050B                 call    Fxn_GetWindowsVersion
.text:00010510                 test    al, al
.text:00010512                 mov     edi, [ebp+var_4]
.text:00010515                 jz      short loc_10565
.text:00010517                 mov     esi, 11Ch
.text:0001051C                 push    esi
.text:0001051D                 lea     eax, [ebp+var_120]
.text:00010523                 push    0FFh
.text:00010528                 push    eax
.text:00010529                 call    memset
.text:0001052E                 mov     [ebp+var_120], esi
.text:00010534                 mov     eax, [edi]      ; # var_4
.text:00010536                 add     esp, 0Ch
.text:00010539                 test    eax, eax
.text:0001053B                 jnz     short loc_10544
.text:0001053D
.text:0001053D loc_1053D:                              ; CODE XREF: sub_104C8+A2↓j
.text:0001053D                 mov     eax, 0C0000001h
.text:00010542                 jmp     short loc_1057A
.text:00010544 ; ---------------------------------------------------------------------------
.text:00010544
.text:00010544 loc_10544:                              ; CODE XREF: sub_104C8+73↑j
.text:00010544                 lea     ecx, [ebp+var_120]
.text:0001054A                 push    ecx
.text:0001054B                 call    eax
.text:0001054D                 test    eax, eax
.text:0001054F                 jnz     short loc_1057A
.text:00010551                 cmp     [ebp+var_C], ax
.text:00010555                 jnz     short loc_10565
.text:00010557                 mov     eax, [edi+4]
.text:0001055A                 neg     eax
.text:0001055C                 sbb     eax, eax
.text:0001055E                 and     eax, 0C0000001h
.text:00010563                 jmp     short loc_1057A
.text:00010565 ; ---------------------------------------------------------------------------
.text:00010565
.text:00010565 loc_10565:                              ; CODE XREF: sub_104C8+4D↑j
.text:00010565                                         ; sub_104C8+8D↑j
.text:00010565                 mov     edi, [edi+4]
.text:00010568                 test    edi, edi
.text:0001056A                 jz      short loc_1053D
.text:0001056C                 call    edi
.text:0001056E                 test    al, al
.text:00010570                 jz      short loc_10578
.text:00010572                 mov     eax, [ebp+arg_0]
.text:00010575                 mov     byte ptr [eax], 0
.text:00010578
.text:00010578 loc_10578:                              ; CODE XREF: sub_104C8+1E↑j
.text:00010578                                         ; sub_104C8+34↑j ...
.text:00010578                 xor     eax, eax
.text:0001057A
.text:0001057A loc_1057A:                              ; CODE XREF: sub_104C8+7A↑j
.text:0001057A                                         ; sub_104C8+87↑j ...
.text:0001057A                 pop     edi
.text:0001057B                 pop     esi
.text:0001057C                 leave
.text:0001057D                 retn    4
.text:0001057D sub_104C8       endp
.text:0001057D



.text:0001089A
.text:0001089A ; =============== S U B R O U T I N E =======================================
.text:0001089A
.text:0001089A ; Attributes: bp-based frame
.text:0001089A
.text:0001089A Fxn_GetWindowsVersion proc near         ; CODE XREF: sub_104C8+2D↑p
.text:0001089A                                         ; sub_104C8+38↑p ...
.text:0001089A
.text:0001089A var_8           = dword ptr -8
.text:0001089A var_4           = dword ptr -4
.text:0001089A arg_0           = dword ptr  8
.text:0001089A
.text:0001089A                 push    ebp
.text:0001089B                 mov     ebp, esp
.text:0001089D                 push    ecx
.text:0001089E                 push    ecx
.text:0001089F                 and     [ebp+var_4], 0
.text:000108A3                 and     [ebp+var_8], 0
.text:000108A7                 push    0
.text:000108A9                 push    0
.text:000108AB                 lea     eax, [ebp+var_8]
.text:000108AE                 push    eax
.text:000108AF                 lea     eax, [ebp+var_4]
.text:000108B2                 push    eax
.text:000108B3                 call    ds:PsGetVersion
.text:000108B9                 cmp     [ebp+var_4], 5
.text:000108BD                 jnz     short loc_108CC
.text:000108BF                 mov     eax, [ebp+arg_0]
.text:000108C2                 cmp     eax, [ebp+var_8]
.text:000108C5                 jnz     short loc_108CC
.text:000108C7                 xor     eax, eax
.text:000108C9                 inc     eax
.text:000108CA                 jmp     short locret_108CE
.text:000108CC ; ---------------------------------------------------------------------------
.text:000108CC
.text:000108CC loc_108CC:                              ; CODE XREF: Fxn_GetWindowsVersion+23↑j
.text:000108CC                                         ; Fxn_GetWindowsVersion+2B↑j
.text:000108CC                 xor     eax, eax
.text:000108CE
.text:000108CE locret_108CE:                           ; CODE XREF: Fxn_GetWindowsVersion+30↑j
.text:000108CE                 leave
.text:000108CF                 retn    4
.text:000108CF Fxn_GetWindowsVersion endp
.text:000108CF