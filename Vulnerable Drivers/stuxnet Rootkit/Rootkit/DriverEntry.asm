.text:000103AA
.text:000103AA ; =============== S U B R O U T I N E =======================================
.text:000103AA
.text:000103AA ; Attributes: bp-based frame
.text:000103AA
.text:000103AA                 public start
.text:000103AA start           proc near               ; DATA XREF: HEADER:00010118↑o
.text:000103AA
.text:000103AA var_28          = byte ptr -28h
.text:000103AA var_20          = byte ptr -20h
.text:000103AA var_1C          = dword ptr -1Ch
.text:000103AA ms_exc          = CPPEH_RECORD ptr -18h
.text:000103AA arg_0           = dword ptr  8
.text:000103AA
.text:000103AA                 push    18h
.text:000103AC                 push    offset stru_13E28
.text:000103B1                 call    __SEH_prolog
.text:000103B6                 xor     ebx, ebx
.text:000103B8                 mov     [ebp+ms_exc.registration.TryLevel], ebx
.text:000103BB                 mov     dword_14120, 80h
.text:000103C5                 push    200h
.text:000103CA                 push    ebx
.text:000103CB                 call    ds:ExAllocatePool
.text:000103D1                 mov     allocatedPool, eax
.text:000103D6                 cmp     eax, ebx
.text:000103D8                 jnz     short loc_103E1
.text:000103DA                 mov     eax, 0C0000001h
.text:000103DF                 jmp     short loc_1040B
.text:000103E1 ; ---------------------------------------------------------------------------
.text:000103E1
.text:000103E1 loc_103E1:                              ; CODE XREF: start+2E↑j
.text:000103E1                 mov     g_byte_14124, 1
.text:000103E8                 mov     [ebp+var_1C], offset unk_13E80
.text:000103EF
.text:000103EF loc_103EF:                              ; CODE XREF: start+5D↓j
.text:000103EF                 cmp     [ebp+var_1C], offset unk_13E84
.text:000103F6                 jnb     short loc_10409
.text:000103F8                 mov     eax, [ebp+var_1C]
.text:000103FB                 mov     eax, [eax]
.text:000103FD                 cmp     eax, ebx
.text:000103FF                 jz      short loc_10403
.text:00010401                 call    eax
.text:00010403
.text:00010403 loc_10403:                              ; CODE XREF: start+55↑j
.text:00010403                 add     [ebp+var_1C], 4
.text:00010407                 jmp     short loc_103EF
.text:00010409 ; ---------------------------------------------------------------------------
.text:00010409
.text:00010409 loc_10409:                              ; CODE XREF: start+4C↑j
.text:00010409                 xor     eax, eax
.text:0001040B
.text:0001040B loc_1040B:                              ; CODE XREF: start+35↑j
.text:0001040B                 cmp     eax, ebx
.text:0001040D                 jnz     loc_104BA
.text:00010413                 mov     al, byte_13E98
.text:00010418                 test    al, al
.text:0001041A                 jz      short loc_10433
.text:0001041C                 xor     eax, eax
.text:0001041E                 mov     esi, 278h
.text:00010423                 mov     ecx, offset g_dword_13E99
.text:00010428                 call    sub_11C42
.text:0001042D                 mov     byte_13E98, bl
.text:00010433
.text:00010433 loc_10433:                              ; CODE XREF: start+70↑j
.text:00010433                 mov     eax, g_dword_13E99
.text:00010438                 test    al, 1
.text:0001043A                 jz      short loc_1044C
.text:0001043C                 mov     eax, ds:InitSafeBootMode
.text:00010441                 cmp     [eax], ebx
.text:00010443                 jz      short loc_1044C
.text:00010445
.text:00010445 loc_10445:                              ; CODE XREF: start+B2↓j
.text:00010445                 mov     eax, 0C0000001h
.text:0001044A                 jmp     short loc_10460
.text:0001044C ; ---------------------------------------------------------------------------
.text:0001044C
.text:0001044C loc_1044C:                              ; CODE XREF: start+90↑j
.text:0001044C                                         ; start+99↑j
.text:0001044C                 mov     eax, g_dword_13E99
.text:00010451                 test    al, 2
.text:00010453                 jz      short loc_1045E
.text:00010455                 mov     eax, ds:KdDebuggerEnabled
.text:0001045A                 cmp     [eax], bl
.text:0001045C                 jnz     short loc_10445
.text:0001045E
.text:0001045E loc_1045E:                              ; CODE XREF: start+A9↑j
.text:0001045E                 xor     eax, eax
.text:00010460
.text:00010460 loc_10460:                              ; CODE XREF: start+A0↑j
.text:00010460                 cmp     eax, ebx
.text:00010462                 jnz     short loc_104BA
.text:00010464                 push    offset devStr
.text:00010469                 lea     eax, [ebp+var_28]
.text:0001046C                 push    eax
.text:0001046D                 call    ds:RtlInitUnicodeString
.text:00010473                 lea     eax, [ebp+var_20] ; # DeviceObject
.text:00010476                 push    eax
.text:00010477                 push    ebx
.text:00010478                 push    100h
.text:0001047D                 push    22h ; '"'
.text:0001047F                 lea     eax, [ebp+var_28]
.text:00010482                 push    eax
.text:00010483                 push    ebx
.text:00010484                 mov     esi, [ebp+arg_0] ; # DriverObject
.text:00010487                 push    esi
.text:00010488                 call    ds:IoCreateDevice
.text:0001048E                 cmp     eax, ebx
.text:00010490                 jnz     short loc_104BA
.text:00010492                 mov     ecx, offset DefaultIoctl
.text:00010497                 mov     [esi+38h], ecx
.text:0001049A                 mov     [esi+40h], ecx
.text:0001049D                 mov     dword ptr [esi+70h], offset IoctlDispatch
.text:000104A4                 push    ebx
.text:000104A5                 push    offset DriverReinitializationRoutine
.text:000104AA                 push    esi
.text:000104AB                 call    ds:IoRegisterDriverReinitialization
.text:000104B1                 jmp     short loc_104BA
.text:000104B3 ; ---------------------------------------------------------------------------
.text:000104B3
.text:000104B3 loc_104B3:                              ; DATA XREF: .rdata:stru_13E28↓o
.text:000104B3                 xor     eax, eax
.text:000104B5                 inc     eax
.text:000104B6                 retn
.text:000104B7 ; ---------------------------------------------------------------------------
.text:000104B7
.text:000104B7 loc_104B7:                              ; DATA XREF: .rdata:stru_13E28↓o
.text:000104B7                 mov     esp, [ebp+ms_exc.old_esp]
.text:000104BA
.text:000104BA loc_104BA:                              ; CODE XREF: start+63↑j
.text:000104BA                                         ; start+B8↑j ...
.text:000104BA                 or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
.text:000104BE                 xor     eax, eax
.text:000104C0                 call    __SEH_epilog
.text:000104C5                 retn    8
.text:000104C5 start           endp
.text:000104C5