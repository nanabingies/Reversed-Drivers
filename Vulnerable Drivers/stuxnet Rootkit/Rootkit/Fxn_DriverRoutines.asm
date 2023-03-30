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



.text:000105A8
.text:000105A8 ; =============== S U B R O U T I N E =======================================
.text:000105A8
.text:000105A8
.text:000105A8 sub_105A8       proc near               ; CODE XREF: sub_104C8+26↑p
.text:000105A8                                         ; RegisterImageCallback+3C↓p
.text:000105A8                 and     dword ptr [esi], 0
.text:000105AB                 test    byte ptr dword_14130, 1
.text:000105B2                 jnz     short loc_105CA
.text:000105B4                 or      dword_14130, 1
.text:000105BB                 call    GetRoutineAddress
.text:000105C0                 mov     edx, offset nullsub_1
.text:000105C5                 call    sub_107DC
.text:000105CA
.text:000105CA loc_105CA:                              ; CODE XREF: sub_105A8+A↑j
.text:000105CA                 mov     byte_13E88, 0
.text:000105D1                 mov     dword ptr [esi], offset dword_14128
.text:000105D7                 mov     eax, esi
.text:000105D9                 retn
.text:000105D9 sub_105A8       endp
.text:000105D9



.text:00010822
.text:00010822 ; =============== S U B R O U T I N E =======================================
.text:00010822
.text:00010822 ; Attributes: bp-based frame
.text:00010822
.text:00010822 GetRoutineAddress proc near             ; CODE XREF: sub_105A8+13↑p
.text:00010822
.text:00010822 var_20          = byte ptr -20h
.text:00010822 ms_exc          = CPPEH_RECORD ptr -18h
.text:00010822
.text:00010822                 push    10h
.text:00010824                 push    offset stru_13DB8
.text:00010829                 call    __SEH_prolog
.text:0001082E                 xor     esi, esi
.text:00010830                 mov     dword_14128, esi
.text:00010836                 mov     dword_1412C, esi
.text:0001083C                 push    esi
.text:0001083D                 call    Fxn_GetWindowsVersion
.text:00010842                 test    al, al
.text:00010844                 jnz     short loc_1088E
.text:00010846                 mov     [ebp+ms_exc.registration.TryLevel], esi
.text:00010849                 push    offset aRtlgetversion ; "RtlGetVersion"
.text:0001084E                 lea     eax, [ebp+var_20]
.text:00010851                 push    eax
.text:00010852                 mov     esi, ds:RtlInitUnicodeString
.text:00010858                 call    esi ; RtlInitUnicodeString
.text:0001085A                 lea     eax, [ebp+var_20]
.text:0001085D                 push    eax
.text:0001085E                 mov     edi, ds:MmGetSystemRoutineAddress
.text:00010864                 call    edi ; MmGetSystemRoutineAddress
.text:00010866                 mov     dword_14128, eax
.text:0001086B                 push    offset aKeareallapcsdi ; "KeAreAllApcsDisabled"
.text:00010870                 lea     eax, [ebp+var_20]
.text:00010873                 push    eax
.text:00010874                 call    esi ; RtlInitUnicodeString
.text:00010876                 lea     eax, [ebp+var_20]
.text:00010879                 push    eax
.text:0001087A                 call    edi ; MmGetSystemRoutineAddress
.text:0001087C                 mov     dword_1412C, eax
.text:00010881                 jmp     short loc_1088A
.text:00010883 ; ---------------------------------------------------------------------------
.text:00010883
.text:00010883 loc_10883:                              ; DATA XREF: .rdata:stru_13DB8↓o
.text:00010883                 xor     eax, eax
.text:00010885                 inc     eax
.text:00010886                 retn
.text:00010887 ; ---------------------------------------------------------------------------
.text:00010887
.text:00010887 loc_10887:                              ; DATA XREF: .rdata:stru_13DB8↓o
.text:00010887                 mov     esp, [ebp+ms_exc.old_esp]
.text:0001088A
.text:0001088A loc_1088A:                              ; CODE XREF: GetRoutineAddress+5F↑j
.text:0001088A                 or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
.text:0001088E
.text:0001088E loc_1088E:                              ; CODE XREF: GetRoutineAddress+22↑j
.text:0001088E                 mov     eax, offset dword_14128
.text:00010893                 call    __SEH_epilog
.text:00010898                 retn
.text:00010898 GetRoutineAddress endp
.text:00010898
.text:00010898 ; ---------------------------------------------------------------------------




.text:00010D06
.text:00010D06 ; =============== S U B R O U T I N E =======================================
.text:00010D06
.text:00010D06 ; Attributes: bp-based frame
.text:00010D06
.text:00010D06 NotifyRoutine   proc near               ; DATA XREF: RegisterImageCallback+41↑o
.text:00010D06
.text:00010D06 ms_exc          = CPPEH_RECORD ptr -18h
.text:00010D06 arg_0           = dword ptr  8
.text:00010D06 arg_4           = dword ptr  0Ch
.text:00010D06 arg_8           = dword ptr  10h
.text:00010D06
.text:00010D06                 push    8
.text:00010D08                 push    offset stru_13E08
.text:00010D0D                 call    __SEH_prolog
.text:00010D12                 call    ds:KeGetCurrentIrql
.text:00010D18                 cmp     al, 1
.text:00010D1A                 ja      short loc_10D41
.text:00010D1C                 cmp     [ebp+arg_4], 0
.text:00010D20                 jz      short loc_10D41
.text:00010D22                 and     [ebp+ms_exc.registration.TryLevel], 0
.text:00010D26                 push    [ebp+arg_8]
.text:00010D29                 push    [ebp+arg_4]
.text:00010D2C                 push    [ebp+arg_0]
.text:00010D2F                 call    PloadImageNotifyRoutine
.text:00010D34                 jmp     short loc_10D3D
.text:00010D36 ; ---------------------------------------------------------------------------
.text:00010D36
.text:00010D36 loc_10D36:                              ; DATA XREF: .rdata:stru_13E08↓o
.text:00010D36                 xor     eax, eax
.text:00010D38                 inc     eax
.text:00010D39                 retn
.text:00010D3A ; ---------------------------------------------------------------------------
.text:00010D3A
.text:00010D3A loc_10D3A:                              ; DATA XREF: .rdata:stru_13E08↓o
.text:00010D3A                 mov     esp, [ebp+ms_exc.old_esp]
.text:00010D3D
.text:00010D3D loc_10D3D:                              ; CODE XREF: NotifyRoutine+2E↑j
.text:00010D3D                 or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
.text:00010D41
.text:00010D41 loc_10D41:                              ; CODE XREF: NotifyRoutine+14↑j
.text:00010D41                                         ; NotifyRoutine+1A↑j
.text:00010D41                 call    __SEH_epilog
.text:00010D46                 retn    0Ch
.text:00010D46 NotifyRoutine   endp
.text:00010D46
.text:00010D46 ; ---------------------------------------------------------------------------