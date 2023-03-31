.text:00010B76
.text:00010B76 ; =============== S U B R O U T I N E =======================================
.text:00010B76
.text:00010B76 ; Attributes: bp-based frame fuzzy-sp
.text:00010B76
.text:00010B76 PloadImageNotifyRoutine proc near       ; CODE XREF: NotifyRoutine+29↓p
.text:00010B76
.text:00010B76 var_48          = dword ptr -48h
.text:00010B76 var_44          = dword ptr -44h
.text:00010B76 var_40          = dword ptr -40h
.text:00010B76 var_3C          = dword ptr -3Ch
.text:00010B76 var_38          = dword ptr -38h
.text:00010B76 var_34          = dword ptr -34h
.text:00010B76 var_30          = dword ptr -30h
.text:00010B76 var_2C          = dword ptr -2Ch
.text:00010B76 var_28          = dword ptr -28h
.text:00010B76 var_24          = dword ptr -24h
.text:00010B76 var_20          = byte ptr -20h
.text:00010B76 var_1C          = dword ptr -1Ch
.text:00010B76 var_14          = byte ptr -14h
.text:00010B76 var_C           = dword ptr -0Ch
.text:00010B76 var_8           = dword ptr -8
.text:00010B76 var_4           = dword ptr -4
.text:00010B76 FullImageName   = dword ptr  8
.text:00010B76 ProcessId       = dword ptr  0Ch
.text:00010B76 ImageInfo       = dword ptr  10h
.text:00010B76
.text:00010B76                 push    ebp
.text:00010B77                 mov     ebp, esp
.text:00010B79                 and     esp, 0FFFFFFF8h
.text:00010B7C                 mov     ecx, [ebp+FullImageName]
.text:00010B7F                 sub     esp, 4Ch
.text:00010B82                 push    ebx
.text:00010B83                 push    esi
.text:00010B84                 push    edi
.text:00010B85                 mov     eax, offset aKernel32Dll ; "KERNEL32.DLL"
.text:00010B8A                 call    sub_11528
.text:00010B8F                 test    al, al
.text:00010B91                 jz      short loc_10BA3
.text:00010B93                 push    [ebp+ImageInfo]
.text:00010B96                 push    [ebp+ProcessId]
.text:00010B99                 call    sub_114CA
.text:00010B9E                 jmp     loc_10CFC
.text:00010BA3 ; ---------------------------------------------------------------------------
.text:00010BA3
.text:00010BA3 loc_10BA3:                              ; CODE XREF: PloadImageNotifyRoutine+1B↑j
.text:00010BA3                 call    sub_10580
.text:00010BA8                 test    eax, eax
.text:00010BAA                 jnz     loc_10CFC
.text:00010BB0                 push    [ebp+ProcessId]
.text:00010BB3                 lea     eax, [esp+5Ch+var_48]
.text:00010BB7                 push    eax
.text:00010BB8                 lea     eax, [esp+60h+var_24]
.text:00010BBC                 xor     ebx, ebx
.text:00010BBE                 push    eax
.text:00010BBF                 mov     [esp+64h+var_48], ebx
.text:00010BC3                 call    sub_11CBE
.text:00010BC8                 cmp     [esp+58h+var_48], ebx
.text:00010BCC                 jnz     loc_10CFC
.text:00010BD2                 mov     eax, [esp+58h+var_24]
.text:00010BD6                 mov     ecx, [ebp+ImageInfo]
.text:00010BD9                 cmp     eax, [ecx+4]
.text:00010BDC                 jnz     loc_10CFC
.text:00010BE2                 mov     eax, g_dword_13E99
.text:00010BE7                 test    al, 4
.text:00010BE9                 jz      short loc_10BF5
.text:00010BEB                 cmp     [esp+58h+var_20], bl
.text:00010BEF                 jnz     loc_10CFC
.text:00010BF5
.text:00010BF5 loc_10BF5:                              ; CODE XREF: PloadImageNotifyRoutine+73↑j
.text:00010BF5                 lea     esi, [esp+58h+var_40]
.text:00010BF9                 call    sub_109B6
.text:00010BFE                 mov     eax, [ebp+ProcessId]
.text:00010C01                 mov     edi, [esp+58h+var_40]
.text:00010C05                 call    sub_10DEC
.text:00010C0A                 lea     esi, [esp+58h+var_3C]
.text:00010C0E                 call    sub_1097A
.text:00010C13                 mov     eax, [esp+58h+var_3C]
.text:00010C17                 mov     eax, [eax+4]
.text:00010C1A                 mov     ecx, [eax+8]
.text:00010C1D                 mov     eax, [eax+0Ch]
.text:00010C20                 mov     [esp+58h+var_8], eax
.text:00010C24                 lea     eax, [esp+58h+var_38]
.text:00010C28                 push    eax
.text:00010C29                 lea     eax, [esp+5Ch+var_C]
.text:00010C2D                 mov     [esp+5Ch+var_C], ecx
.text:00010C31                 mov     [esp+5Ch+var_4], ebx
.text:00010C35                 mov     [esp+5Ch+var_34], ebx
.text:00010C39                 mov     [esp+5Ch+var_30], ebx
.text:00010C3D                 call    sub_10D4A
.text:00010C42                 lea     edi, [esp+58h+var_34]
.text:00010C46                 lea     esi, [esp+58h+var_C]
.text:00010C4A                 call    sub_10B52
.text:00010C4F                 lea     eax, [esp+58h+var_44]
.text:00010C53                 push    eax
.text:00010C54                 mov     eax, esi
.text:00010C56                 call    sub_10D4A
.text:00010C5B                 mov     esi, [esp+58h+var_4]
.text:00010C5F                 cmp     esi, [esp+58h+var_8]
.text:00010C63                 ja      loc_10CFC
.text:00010C69                 cmp     [esp+58h+var_38], ebx
.text:00010C6D                 jnz     loc_10CFC
.text:00010C73                 cmp     [esp+58h+var_44], ebx
.text:00010C77                 mov     [esp+58h+var_1C], ebx
.text:00010C7B                 mov     [esp+58h+var_2C], ebx
.text:00010C7F                 mov     [esp+58h+var_28], ebx
.text:00010C83                 mov     [esp+58h+var_48], ebx
.text:00010C87                 jbe     short loc_10CFC
.text:00010C89
.text:00010C89 loc_10C89:                              ; CODE XREF: PloadImageNotifyRoutine+184↓j
.text:00010C89                 mov     eax, [esp+58h+var_C]
.text:00010C8D                 lea     ebx, [esi+eax]
.text:00010C90                 add     esi, 10h
.text:00010C93                 mov     [esp+58h+var_4], esi
.text:00010C97                 lea     edi, [esp+58h+var_1C]
.text:00010C9B                 lea     esi, [esp+58h+var_C]
.text:00010C9F                 mov     [esp+58h+var_38], ebx
.text:00010CA3                 call    sub_10B52
.text:00010CA8                 lea     edi, [esp+58h+var_2C]
.text:00010CAC                 call    sub_10B52
.text:00010CB1                 mov     esi, [esp+58h+var_4]
.text:00010CB5                 cmp     esi, [esp+58h+var_8]
.text:00010CB9                 ja      short loc_10CFC
.text:00010CBB                 mov     eax, [esp+58h+var_1C]
.text:00010CBF                 mov     ecx, [ebp+FullImageName]
.text:00010CC2                 call    sub_11528
.text:00010CC7                 test    al, al
.text:00010CC9                 jz      short loc_10CEE
.text:00010CCB                 push    dword ptr [ebx+0Ch]
.text:00010CCE                 lea     eax, [esp+5Ch+var_34]
.text:00010CD2                 lea     ebx, [esp+5Ch+var_14]
.text:00010CD6                 call    sub_10F3A
.text:00010CDB                 push    eax
.text:00010CDC                 mov     eax, edi
.text:00010CDE                 push    eax
.text:00010CDF                 push    [esp+60h+var_38]
.text:00010CE3                 push    [ebp+ImageInfo]
.text:00010CE6                 push    [ebp+ProcessId]
.text:00010CE9                 call    sub_112A6
.text:00010CEE
.text:00010CEE loc_10CEE:                              ; CODE XREF: PloadImageNotifyRoutine+153↑j
.text:00010CEE                 inc     [esp+58h+var_48]
.text:00010CF2                 mov     eax, [esp+58h+var_48]
.text:00010CF6                 cmp     eax, [esp+58h+var_44]
.text:00010CFA                 jb      short loc_10C89
.text:00010CFC
.text:00010CFC loc_10CFC:                              ; CODE XREF: PloadImageNotifyRoutine+28↑j
.text:00010CFC                                         ; PloadImageNotifyRoutine+34↑j ...
.text:00010CFC                 pop     edi
.text:00010CFD                 pop     esi
.text:00010CFE                 pop     ebx
.text:00010CFF                 mov     esp, ebp
.text:00010D01                 pop     ebp
.text:00010D02                 retn    0Ch
.text:00010D02 PloadImageNotifyRoutine endp
.text:00010D02
.text:00010D02 ; ---------------------------------------------------------------------------
