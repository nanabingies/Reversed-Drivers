.text:0000000000011EB0
.text:0000000000011EB0 ; =============== S U B R O U T I N E =======================================
.text:0000000000011EB0
.text:0000000000011EB0
.text:0000000000011EB0 ; __int64 __fastcall IOCTL(__int64, __int64)
.text:0000000000011EB0 IOCTL           proc near               ; DATA XREF: DriverEntry:loc_11FD6↓o
.text:0000000000011EB0
.text:0000000000011EB0 var_28          = dword ptr -28h
.text:0000000000011EB0 var_20          = qword ptr -20h
.text:0000000000011EB0 var_18          = qword ptr -18h
.text:0000000000011EB0 arg_0           = dword ptr  8
.text:0000000000011EB0 arg_10          = qword ptr  18h
.text:0000000000011EB0 arg_18          = qword ptr  20h
.text:0000000000011EB0
.text:0000000000011EB0                 sub     rsp, 48h
.text:0000000000011EB4                 mov     r8, [rcx+40h]   ; # DeviceExtension
.text:0000000000011EB8                 mov     rcx, [rdx+0B8h] ; # rcx = ioStackLocation
.text:0000000000011EBF                 mov     [rsp+48h+arg_10], rbx
.text:0000000000011EC4                 mov     [rsp+48h+arg_18], rdi
.text:0000000000011EC9                 xor     edi, edi
.text:0000000000011ECB                 mov     rbx, rdx        ; # Irp
.text:0000000000011ECE                 mov     [rdx+30h], edi  ; # Irp.IoStatus.Status
.text:0000000000011ED1                 mov     [rdx+38h], rdi  ; # Irp.IoStatus.Information
.text:0000000000011ED5                 cmp     byte ptr [rcx], 0Eh ; # MajorFunction
.text:0000000000011ED8                 jnz     short loc_11F11
.text:0000000000011EDA                 mov     eax, [rcx+arg_0]
.text:0000000000011EDD                 mov     rdx, [rdx+18h]  ; # SystemBuffer
.text:0000000000011EE1                 mov     [rsp+48h+var_18], r8
.text:0000000000011EE6                 lea     r8, [rsp+48h+arg_0]
.text:0000000000011EEB                 mov     r9, rdx
.text:0000000000011EEE                 mov     [rsp+48h+arg_0], edi ;  # 0
.text:0000000000011EF2                 mov     [rsp+48h+var_20], r8
.text:0000000000011EF7                 mov     r8d, [rcx+10h]  ; # InputBufferLength
.text:0000000000011EFB                 mov     ecx, [rcx+18h]  ; # IoControlCode
.text:0000000000011EFE                 mov     [rsp+48h+var_28], eax ; # OutputBufferLength
.text:0000000000011F02                 call    DeviceIoControl ; DeviceIoControl(IoControlCode, SystemBuffer, InputBufferLength, SystemBuffer, OutputBufferLength, &arg_0)
.text:0000000000011F02                                         ; rdi=SystemBuffer, rsi=SystemBuffer, ecx=ctlcode
.text:0000000000011F07                 mov     ecx, [rsp+48h+arg_0]
.text:0000000000011F0B                 mov     [rbx+38h], rcx
.text:0000000000011F0F                 mov     edi, eax
.text:0000000000011F11
.text:0000000000011F11 loc_11F11:                              ; CODE XREF: IOCTL+28↑j
.text:0000000000011F11                 xor     edx, edx
.text:0000000000011F13                 mov     rcx, rbx
.text:0000000000011F16                 mov     [rbx+30h], edi
.text:0000000000011F19                 call    cs:IofCompleteRequest
.text:0000000000011F1F                 mov     rbx, [rsp+48h+arg_10]
.text:0000000000011F24                 mov     eax, edi
.text:0000000000011F26                 mov     rdi, [rsp+48h+arg_18]
.text:0000000000011F2B                 add     rsp, 48h
.text:0000000000011F2F                 retn
.text:0000000000011F2F IOCTL           endp
.text:0000000000011F2F
.text:0000000000011F2F ; ---------------------------------------------------------------------------