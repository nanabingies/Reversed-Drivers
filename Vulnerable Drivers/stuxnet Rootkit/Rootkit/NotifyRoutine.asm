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