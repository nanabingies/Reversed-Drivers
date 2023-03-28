.text:00000001400011E0
.text:00000001400011E0 ; =============== S U B R O U T I N E =======================================
.text:00000001400011E0
.text:00000001400011E0 ; Attributes: bp-based frame fpd=57h
.text:00000001400011E0
.text:00000001400011E0 ; __int64 __fastcall Fn_MapmemPhysical(__int64, __int64, __int64)
.text:00000001400011E0 Fn_MapmemPhysical proc near             ; CODE XREF: DefaultIoctl:loc_14000117D↑p
.text:00000001400011E0
.text:00000001400011E0 var_C0          = qword ptr -0C0h
.text:00000001400011E0 var_B8          = qword ptr -0B8h
.text:00000001400011E0 var_B0          = qword ptr -0B0h
.text:00000001400011E0 var_A8          = dword ptr -0A8h
.text:00000001400011E0 var_A0          = dword ptr -0A0h
.text:00000001400011E0 var_98          = dword ptr -98h
.text:00000001400011E0 var_90          = qword ptr -90h
.text:00000001400011E0 var_88          = qword ptr -88h
.text:00000001400011E0 var_80          = qword ptr -80h
.text:00000001400011E0 var_78          = qword ptr -78h
.text:00000001400011E0 var_70          = qword ptr -70h
.text:00000001400011E0 var_68          = qword ptr -68h
.text:00000001400011E0 var_60          = qword ptr -60h
.text:00000001400011E0 usString        = byte ptr -58h
.text:00000001400011E0 var_48          = dword ptr -48h
.text:00000001400011E0 var_40          = qword ptr -40h
.text:00000001400011E0 var_38          = qword ptr -38h
.text:00000001400011E0 var_30          = dword ptr -30h
.text:00000001400011E0 var_28          = xmmword ptr -28h
.text:00000001400011E0 arg_0           = qword ptr  10h
.text:00000001400011E0 arg_8           = dword ptr  18h
.text:00000001400011E0 arg_10          = dword ptr  20h
.text:00000001400011E0
.text:00000001400011E0                 mov     [rsp-8+arg_0], rbx
.text:00000001400011E5                 push    rbp
.text:00000001400011E6                 push    rsi
.text:00000001400011E7                 push    rdi
.text:00000001400011E8                 lea     rbp, [rsp-47h]
.text:00000001400011ED                 sub     rsp, 0D0h
.text:00000001400011F4                 mov     eax, [r8+10h]   ; # InputBufferLength
.text:00000001400011F8                 mov     rsi, rdx        ; # Irp
.text:00000001400011FB                 mov     ecx, [r8+8]     ; # OutputBufferLength
.text:00000001400011FF                 and     qword ptr [rdx+38h], 0
.text:0000000140001204                 and     [rbp+57h+var_80], 0
.text:0000000140001209                 and     [rbp+57h+var_60], 0
.text:000000014000120E                 mov     rdi, [rdx+18h]  ; # SystemBuffer
.text:0000000140001212                 cmp     eax, 18h
.text:0000000140001215                 jb      loc_14000145B
.text:000000014000121B                 cmp     ecx, 18h
.text:000000014000121E                 jb      loc_14000145B
.text:0000000140001224                 mov     eax, [rdi]
.text:0000000140001226                 lea     rdx, aDevicePhysical ; "\\Device\\PhysicalMemory"
.text:000000014000122D                 mov     dword ptr [rbp+57h+var_78], eax
.text:0000000140001230                 lea     rcx, [rbp+57h+usString]
.text:0000000140001234                 mov     eax, [rdi+4]
.text:0000000140001237                 and     [rbp+57h+arg_10], 0
.text:000000014000123B                 and     [rbp+57h+arg_8], 0
.text:000000014000123F                 mov     ebx, [rdi+10h]
.text:0000000140001242                 mov     dword ptr [rbp+57h+var_78+4], eax
.text:0000000140001245                 call    cs:RtlInitUnicodeString
.text:000000014000124B                 and     [rbp+57h+var_40], 0
.text:0000000140001250                 lea     rax, [rbp+57h+usString]
.text:0000000140001254                 xorps   xmm0, xmm0
.text:0000000140001257                 mov     [rbp+57h+var_38], rax
.text:000000014000125B                 lea     r8, [rbp+57h+var_48]
.text:000000014000125F                 mov     [rbp+57h+var_48], 30h ; '0' ; # sizeof(_OBJECT_ATTRIBUTES)
.text:0000000140001266                 mov     edx, 0F001Fh
.text:000000014000126B                 mov     [rbp+57h+var_30], 40h ; '@'
.text:0000000140001272                 lea     rcx, [rbp+57h+var_80]
.text:0000000140001276                 movdqu  [rbp+57h+var_28], xmm0
.text:000000014000127B                 call    cs:ZwOpenSection
.text:0000000140001281                 and     [rsp+0E0h+var_B8], 0
.text:0000000140001287                 lea     rax, [rbp+57h+var_60]
.text:000000014000128B                 mov     rcx, [rbp+57h+var_80]
.text:000000014000128F                 xor     r9d, r9d
.text:0000000140001292                 xor     r8d, r8d
.text:0000000140001295                 mov     [rsp+0E0h+var_C0], rax
.text:000000014000129A                 mov     edx, 0F001Fh
.text:000000014000129F                 call    cs:ObReferenceObjectByHandle
.text:00000001400012A5                 test    eax, eax
.text:00000001400012A7                 jns     short loc_1400012B5
.text:00000001400012A9                 lea     rcx, aMapmemObrefere ; "(MAPMEM) ObReferenceObjectByHandle fail"...
.text:00000001400012B0                 jmp     loc_140001448
.text:00000001400012B5 ; ---------------------------------------------------------------------------
.text:00000001400012B5
.text:00000001400012B5 loc_1400012B5:                          ; CODE XREF: Fn_MapmemPhysical+C7↑j
.text:00000001400012B5                 mov     r8, [rbp+57h+var_78]
.text:00000001400012B9                 lea     r9, [rbp+57h+arg_8]
.text:00000001400012BD                 xor     edx, edx
.text:00000001400012BF                 lea     rax, [r8+rbx]
.text:00000001400012C3                 mov     [rbp+57h+var_88], rax
.text:00000001400012C7                 lea     ecx, [rdx+1]
.text:00000001400012CA                 lea     rax, [rbp+57h+var_90]
.text:00000001400012CE                 mov     [rsp+0E0h+var_C0], rax
.text:00000001400012D3                 call    cs:HalTranslateBusAddress
.text:00000001400012D9                 mov     r8, [rbp+57h+var_88]
.text:00000001400012DD                 lea     r9, [rbp+57h+arg_10]
.text:00000001400012E1                 xor     edx, edx
.text:00000001400012E3                 mov     bl, al
.text:00000001400012E5                 lea     rax, [rbp+57h+var_88]
.text:00000001400012E9                 mov     [rsp+0E0h+var_C0], rax
.text:00000001400012EE                 lea     ecx, [rdx+1]
.text:00000001400012F1                 call    cs:HalTranslateBusAddress
.text:00000001400012F7                 test    bl, bl
.text:00000001400012F9                 jz      loc_140001441
.text:00000001400012FF                 test    al, al
.text:0000000140001301                 jz      loc_140001441
.text:0000000140001307                 mov     r8d, dword ptr [rbp+57h+var_90]
.text:000000014000130B                 lea     rcx, aMapmemPhysical ; "(MAPMEM) physicalAddressbase=%8.8x %8.8"...
.text:0000000140001312                 mov     edx, dword ptr [rbp+57h+var_90+4]
.text:0000000140001315                 call    DbgPrint
.text:000000014000131A                 mov     r8d, dword ptr [rbp+57h+var_88]
.text:000000014000131E                 lea     rcx, aMapmemPhysical_0 ; "(MAPMEM) physicalAddressend=%8.8x %8.8x"...
.text:0000000140001325                 mov     edx, dword ptr [rbp+57h+var_88+4]
.text:0000000140001328                 call    DbgPrint
.text:000000014000132D                 mov     rax, [rbp+57h+var_88]
.text:0000000140001331                 mov     rcx, [rbp+57h+var_90]
.text:0000000140001335                 sub     rax, rcx
.text:0000000140001338                 test    eax, eax
.text:000000014000133A                 jnz     short loc_140001348
.text:000000014000133C                 lea     rcx, aMapmemMappedle ; "(MAPMEM) mappedLength.LowPart == 0\n"
.text:0000000140001343                 jmp     loc_140001448
.text:0000000140001348 ; ---------------------------------------------------------------------------
.text:0000000140001348
.text:0000000140001348 loc_140001348:                          ; CODE XREF: Fn_MapmemPhysical+15A↑j
.text:0000000140001348                 cmp     [rbp+57h+arg_8], 0
.text:000000014000134C                 jz      short loc_14000136B
.text:000000014000134E                 lea     rcx, aIniospace1 ; "inIoSpace = 1\n"
.text:0000000140001355                 call    DbgPrint
.text:000000014000135A                 mov     eax, dword ptr [rbp+57h+var_90]
.text:000000014000135D                 mov     [rdi+8], eax
.text:0000000140001360                 mov     eax, dword ptr [rbp+57h+var_90+4]
.text:0000000140001363                 mov     [rdi+0Ch], eax
.text:0000000140001366                 jmp     loc_14000142B
.text:000000014000136B ; ---------------------------------------------------------------------------
.text:000000014000136B
.text:000000014000136B loc_14000136B:                          ; CODE XREF: Fn_MapmemPhysical+16C↑j
.text:000000014000136B                 and     [rbp+57h+var_70], 0
.text:0000000140001370                 mov     r8d, ecx
.text:0000000140001373                 mov     edx, eax        ; # endBusAddress
.text:0000000140001375                 mov     [rbp+57h+var_78], rdx
.text:0000000140001379                 mov     rdx, rcx
.text:000000014000137C                 mov     [rbp+57h+var_68], rcx
.text:0000000140001380                 lea     rcx, aViewbaseXX ; "viewBase:%x %x\n"
.text:0000000140001387                 shr     rdx, 20h
.text:000000014000138B                 call    DbgPrint
.text:0000000140001390                 mov     rcx, [rbp+57h+var_80] ; # sectionHandle
.text:0000000140001394                 lea     rax, [rbp+57h+var_78]
.text:0000000140001398                 mov     [rsp+0E0h+var_98], 204h
.text:00000001400013A0                 lea     r8, [rbp+57h+var_70] ; # BaseAddress
.text:00000001400013A4                 and     [rsp+0E0h+var_A0], 0
.text:00000001400013A9                 xor     r9d, r9d
.text:00000001400013AC                 mov     [rsp+0E0h+var_A8], 1
.text:00000001400013B4                 or      rdx, 0FFFFFFFFFFFFFFFFh
.text:00000001400013B8                 mov     [rsp+0E0h+var_B0], rax
.text:00000001400013BD                 lea     rax, [rbp+57h+var_68]
.text:00000001400013C1                 mov     [rsp+0E0h+var_B8], rax
.text:00000001400013C6                 mov     rax, [rbp+57h+var_78]
.text:00000001400013CA                 mov     [rsp+0E0h+var_C0], rax
.text:00000001400013CF                 call    cs:ZwMapViewOfSection
.text:00000001400013D5                 test    eax, eax
.text:00000001400013D7                 jns     short loc_1400013E9
.text:00000001400013D9                 mov     edx, eax
.text:00000001400013DB                 lea     rcx, aMapmemZwmapvie ; "(MAPMEM) ZwMapViewOfSection failed:%x\n"
.text:00000001400013E2                 call    DbgPrint
.text:00000001400013E7                 jmp     short loc_14000144D
.text:00000001400013E9 ; ---------------------------------------------------------------------------
.text:00000001400013E9
.text:00000001400013E9 loc_1400013E9:                          ; CODE XREF: Fn_MapmemPhysical+1F7↑j
.text:00000001400013E9                 mov     rdx, [rbp+57h+var_80]
.text:00000001400013ED                 lea     rcx, aMapmemPhysical_1 ; "(MAPMEM) physicalMemoryHandle=%x\n"
.text:00000001400013F4                 call    DbgPrint
.text:00000001400013F9                 mov     rcx, [rbp+57h+var_70]
.text:00000001400013FD                 mov     rax, [rbp+57h+var_90]
.text:0000000140001401                 sub     rax, [rbp+57h+var_68]
.text:0000000140001405                 add     rcx, rax
.text:0000000140001408                 mov     [rbp+57h+var_70], rcx
.text:000000014000140C                 mov     r8d, ecx
.text:000000014000140F                 mov     [rdi+8], ecx
.text:0000000140001412                 lea     rcx, aMapmemVirtuala ; "(MAPMEM) virtualAddress=%x %x\n"
.text:0000000140001419                 mov     rax, [rbp+57h+var_70]
.text:000000014000141D                 sar     rax, 20h
.text:0000000140001421                 mov     edx, eax
.text:0000000140001423                 mov     [rdi+0Ch], eax
.text:0000000140001426                 call    DbgPrint
.text:000000014000142B
.text:000000014000142B loc_14000142B:                          ; CODE XREF: Fn_MapmemPhysical+186↑j
.text:000000014000142B                 lea     rcx, aMapmemMemorySu ; "(MAPMEM) memory successfully mapped\n"
.text:0000000140001432                 call    DbgPrint
.text:0000000140001437                 mov     qword ptr [rsi+38h], 18h
.text:000000014000143F                 jmp     short loc_14000144D
.text:0000000140001441 ; ---------------------------------------------------------------------------
.text:0000000140001441
.text:0000000140001441 loc_140001441:                          ; CODE XREF: Fn_MapmemPhysical+119↑j
.text:0000000140001441                                         ; Fn_MapmemPhysical+121↑j
.text:0000000140001441                 lea     rcx, aMapmemHaltrans ; "(MAPMEM) HalTranslatephysicalAddress fa"...
.text:0000000140001448
.text:0000000140001448 loc_140001448:                          ; CODE XREF: Fn_MapmemPhysical+D0↑j
.text:0000000140001448                                         ; Fn_MapmemPhysical+163↑j
.text:0000000140001448                 call    DbgPrint
.text:000000014000144D
.text:000000014000144D loc_14000144D:                          ; CODE XREF: Fn_MapmemPhysical+207↑j
.text:000000014000144D                                         ; Fn_MapmemPhysical+25F↑j
.text:000000014000144D                 mov     rcx, [rbp+57h+var_80]
.text:0000000140001451                 call    cs:ZwClose
.text:0000000140001457                 xor     eax, eax
.text:0000000140001459                 jmp     short loc_14000146C
.text:000000014000145B ; ---------------------------------------------------------------------------
.text:000000014000145B
.text:000000014000145B loc_14000145B:                          ; CODE XREF: Fn_MapmemPhysical+35↑j
.text:000000014000145B                                         ; Fn_MapmemPhysical+3E↑j
.text:000000014000145B                 lea     rcx, aMapmemBufferSi ; "(MAPMEM) Buffer size error\n"
.text:0000000140001462                 call    DbgPrint
.text:0000000140001467                 mov     eax, 0C000009Ah
.text:000000014000146C
.text:000000014000146C loc_14000146C:                          ; CODE XREF: Fn_MapmemPhysical+279↑j
.text:000000014000146C                 mov     rbx, [rsp+0E0h+arg_0]
.text:0000000140001474                 add     rsp, 0D0h
.text:000000014000147B                 pop     rdi
.text:000000014000147C                 pop     rsi
.text:000000014000147D                 pop     rbp
.text:000000014000147E                 retn
.text:000000014000147E Fn_MapmemPhysical endp
.text:000000014000147E
.text:000000014000147E ; ---------------------------------------------------------------------------
.text:000000014000147F                 align 20h