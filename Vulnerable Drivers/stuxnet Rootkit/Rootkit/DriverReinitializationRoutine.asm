.text:0001034C
.text:0001034C ; =============== S U B R O U T I N E =======================================
.text:0001034C
.text:0001034C ; Attributes: bp-based frame
.text:0001034C
.text:0001034C DriverReinitializationRoutine proc near ; DATA XREF: DriverReinitializationRoutine+34↓o
.text:0001034C                                         ; start+FB↓o
.text:0001034C
.text:0001034C ms_exc          = CPPEH_RECORD ptr -18h
.text:0001034C arg_0           = dword ptr  8
.text:0001034C arg_8           = dword ptr  10h
.text:0001034C
.text:0001034C                 push    8
.text:0001034E                 push    offset stru_13E18
.text:00010353                 call    __SEH_prolog
.text:00010358                 and     [ebp+ms_exc.registration.TryLevel], 0
.text:0001035C                 call    ds:KeGetCurrentIrql
.text:00010362                 test    al, al
.text:00010364                 jnz     short loc_1039E
.text:00010366                 cmp     [ebp+arg_8], 65h ; 'e'
.text:0001036A                 ja      short loc_1039E
.text:0001036C                 call    sub_10580
.text:00010371                 test    eax, eax
.text:00010373                 jnz     short loc_1039E
.text:00010375                 call    GetHaldllHandle
.text:0001037A                 test    al, al
.text:0001037C                 jnz     short loc_10390
.text:0001037E                 push    0
.text:00010380                 push    offset DriverReinitializationRoutine
.text:00010385                 push    [ebp+arg_0]
.text:00010388                 call    ds:IoRegisterDriverReinitialization
.text:0001038E                 jmp     short loc_1039E
.text:00010390 ; ---------------------------------------------------------------------------
.text:00010390
.text:00010390 loc_10390:                              ; CODE XREF: DriverReinitializationRoutine+30↑j
.text:00010390                 call    RegisterImageCallback
.text:00010395                 jmp     short loc_1039E
.text:00010397 ; ---------------------------------------------------------------------------
.text:00010397
.text:00010397 loc_10397:                              ; DATA XREF: .rdata:stru_13E18↓o
.text:00010397                 xor     eax, eax
.text:00010399                 inc     eax
.text:0001039A                 retn
.text:0001039B ; ---------------------------------------------------------------------------
.text:0001039B
.text:0001039B loc_1039B:                              ; DATA XREF: .rdata:stru_13E18↓o
.text:0001039B                 mov     esp, [ebp+ms_exc.old_esp]
.text:0001039E
.text:0001039E loc_1039E:                              ; CODE XREF: DriverReinitializationRoutine+18↑j
.text:0001039E                                         ; DriverReinitializationRoutine+1E↑j ...
.text:0001039E                 or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
.text:000103A2                 call    __SEH_epilog
.text:000103A7                 retn    0Ch
.text:000103A7 DriverReinitializationRoutine endp
.text:000103A7