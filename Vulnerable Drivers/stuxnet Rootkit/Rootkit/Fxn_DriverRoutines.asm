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