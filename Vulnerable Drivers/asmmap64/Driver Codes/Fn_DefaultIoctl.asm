.text:000000014000112C
.text:000000014000112C ; =============== S U B R O U T I N E =======================================
.text:000000014000112C
.text:000000014000112C
.text:000000014000112C ; __int64 __fastcall DefaultIoctl(__int64, __int64)
.text:000000014000112C DefaultIoctl    proc near               ; DATA XREF: DriverEntry+4↑o
.text:000000014000112C
.text:000000014000112C arg_0           = qword ptr  8
.text:000000014000112C
.text:000000014000112C                 mov     [rsp+arg_0], rbx
.text:0000000140001131                 push    rdi
.text:0000000140001132                 sub     rsp, 20h
.text:0000000140001136                 and     qword ptr [rdx+38h], 0 ; # IoStatus.Information
.text:000000014000113B                 mov     rdi, rdx
.text:000000014000113E                 mov     r8, [rdx+0B8h]
.text:0000000140001145                 mov     ebx, 0C0000002h
.text:000000014000114A                 mov     rcx, [rcx+40h]
.text:000000014000114E                 mov     al, [r8]
.text:0000000140001151                 test    al, 0FDh
.text:0000000140001153                 jz      short loc_140001186
.text:0000000140001155                 cmp     al, 0Eh
.text:0000000140001157                 jnz     short loc_140001188
.text:0000000140001159                 mov     r9d, [r8+18h]   ; # IoControlCode
.text:000000014000115D                 cmp     r9d, 9C402580h
.text:0000000140001164                 jz      short loc_14000117D
.text:0000000140001166                 cmp     r9d, 9C402584h
.text:000000014000116D                 jz      short loc_140001176
.text:000000014000116F                 mov     ebx, 0C000000Dh
.text:0000000140001174                 jmp     short loc_140001188
.text:0000000140001176 ; ---------------------------------------------------------------------------
.text:0000000140001176
.text:0000000140001176 loc_140001176:                          ; CODE XREF: DefaultIoctl+41↑j
.text:0000000140001176                 call    Fn_Ummapmem
.text:000000014000117B                 jmp     short loc_140001182
.text:000000014000117D ; ---------------------------------------------------------------------------
.text:000000014000117D
.text:000000014000117D loc_14000117D:                          ; CODE XREF: DefaultIoctl+38↑j
.text:000000014000117D                 call    Fn_MapmemPhysical
.text:0000000140001182
.text:0000000140001182 loc_140001182:                          ; CODE XREF: DefaultIoctl+4F↑j
.text:0000000140001182                 mov     ebx, eax
.text:0000000140001184                 jmp     short loc_140001188
.text:0000000140001186 ; ---------------------------------------------------------------------------
.text:0000000140001186
.text:0000000140001186 loc_140001186:                          ; CODE XREF: DefaultIoctl+27↑j
.text:0000000140001186                 xor     ebx, ebx
.text:0000000140001188
.text:0000000140001188 loc_140001188:                          ; CODE XREF: DefaultIoctl+2B↑j
.text:0000000140001188                                         ; DefaultIoctl+48↑j ...
.text:0000000140001188                 xor     edx, edx
.text:000000014000118A                 mov     [rdi+30h], ebx
.text:000000014000118D                 mov     rcx, rdi
.text:0000000140001190                 call    cs:IofCompleteRequest
.text:0000000140001196                 mov     eax, ebx
.text:0000000140001198                 mov     rbx, [rsp+28h+arg_0]
.text:000000014000119D                 add     rsp, 20h
.text:00000001400011A1                 pop     rdi
.text:00000001400011A2                 retn
.text:00000001400011A2 DefaultIoctl    endp
.text:00000001400011A2
.text:00000001400011A2 ; ---------------------------------------------------------------------------
.text:00000001400011A3                 align 4