.text:00010A04
.text:00010A04 ; =============== S U B R O U T I N E =======================================
.text:00010A04
.text:00010A04 ; Attributes: bp-based frame
.text:00010A04
.text:00010A04 IoctlDispatch   proc near               ; DATA XREF: start+F3↑o
.text:00010A04
.text:00010A04 var_1C          = dword ptr -1Ch
.text:00010A04 ms_exc          = CPPEH_RECORD ptr -18h
.text:00010A04 arg_4           = dword ptr  0Ch
.text:00010A04
.text:00010A04                 push    0Ch
.text:00010A06                 push    offset stru_13DE8
.text:00010A0B                 call    __SEH_prolog
.text:00010A10                 mov     ecx, 0C0000002h
.text:00010A15                 mov     [ebp+var_1C], ecx ; # ntStatus
.text:00010A18                 and     [ebp+ms_exc.registration.TryLevel], 0
.text:00010A1C                 mov     esi, [ebp+arg_4] ; # Irp
.text:00010A1F                 mov     eax, [esi+60h]
.text:00010A22                 cmp     dword ptr [eax+0Ch], 223800h
.text:00010A29                 jz      short loc_10A2F
.text:00010A2B                 mov     eax, ecx
.text:00010A2D                 jmp     short loc_10A35
.text:00010A2F ; ---------------------------------------------------------------------------
.text:00010A2F
.text:00010A2F loc_10A2F:                              ; CODE XREF: IoctlDispatch+25↑j
.text:00010A2F                 push    esi
.text:00010A30                 call    sub_11A48
.text:00010A35
.text:00010A35 loc_10A35:                              ; CODE XREF: IoctlDispatch+29↑j
.text:00010A35                 mov     edi, eax
.text:00010A37                 mov     [ebp+var_1C], edi
.text:00010A3A                 or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
.text:00010A3E                 jmp     short loc_10A51
.text:00010A40 ; ---------------------------------------------------------------------------
.text:00010A40
.text:00010A40 loc_10A40:                              ; DATA XREF: .rdata:stru_13DE8↓o
.text:00010A40                 xor     eax, eax
.text:00010A42                 inc     eax
.text:00010A43                 retn
.text:00010A44 ; ---------------------------------------------------------------------------
.text:00010A44
.text:00010A44 loc_10A44:                              ; DATA XREF: .rdata:stru_13DE8↓o
.text:00010A44                 mov     esp, [ebp+ms_exc.old_esp]
.text:00010A47                 or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
.text:00010A4B                 mov     esi, [ebp+arg_4]
.text:00010A4E                 mov     edi, [ebp+var_1C]
.text:00010A51
.text:00010A51 loc_10A51:                              ; CODE XREF: IoctlDispatch+3A↑j
.text:00010A51                 mov     eax, 103h
.text:00010A56                 cmp     edi, eax
.text:00010A58                 jz      short loc_10A71
.text:00010A5A                 test    edi, edi
.text:00010A5C                 jz      short loc_10A62
.text:00010A5E                 and     dword ptr [esi+1Ch], 0
.text:00010A62
.text:00010A62 loc_10A62:                              ; CODE XREF: IoctlDispatch+58↑j
.text:00010A62                 mov     [esi+18h], edi
.text:00010A65                 xor     dl, dl
.text:00010A67                 mov     ecx, esi
.text:00010A69                 call    ds:IofCompleteRequest
.text:00010A6F                 mov     eax, edi
.text:00010A71
.text:00010A71 loc_10A71:                              ; CODE XREF: IoctlDispatch+54↑j
.text:00010A71                 call    __SEH_epilog
.text:00010A76                 retn    8
.text:00010A76 IoctlDispatch   endp
.text:00010A76
.text:00010A76 ; ---------------------------------------------------------------------------