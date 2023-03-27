.text:00000000000119B0
.text:00000000000119B0 ; =============== S U B R O U T I N E =======================================
.text:00000000000119B0
.text:00000000000119B0
.text:00000000000119B0 ; __int64 __fastcall UnmapPhysical(__int64)
.text:00000000000119B0 UnmapPhysical   proc near               ; CODE XREF: DeviceIoControl+1AB↓p
.text:00000000000119B0
.text:00000000000119B0 arg_10          = qword ptr  18h
.text:00000000000119B0 arg_18          = qword ptr  20h
.text:00000000000119B0
.text:00000000000119B0                 sub     rsp, 28h
.text:00000000000119B4                 mov     [rsp+28h+arg_10], rbx
.text:00000000000119B9                 mov     [rsp+28h+arg_18], rdi
.text:00000000000119BE                 mov     rdi, rcx
.text:00000000000119C1                 mov     rcx, 0FFFFFFFFFFFFFFFFh
.text:00000000000119C8                 call    cs:ZwUnmapViewOfSection
.text:00000000000119CE                 mov     rcx, rdi
.text:00000000000119D1                 mov     ebx, eax
.text:00000000000119D3                 call    cs:ZwClose
.text:00000000000119D9                 mov     rdi, [rsp+28h+arg_18]
.text:00000000000119DE                 mov     eax, ebx
.text:00000000000119E0                 mov     rbx, [rsp+28h+arg_10]
.text:00000000000119E5                 add     rsp, 28h
.text:00000000000119E9                 retn
.text:00000000000119E9 UnmapPhysical   endp
.text:00000000000119E9
.text:00000000000119E9 ; ---------------------------------------------------------------------------