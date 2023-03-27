
__int64 __fastcall DeviceIoControl(
    int ioctlCode,
    __int64 systemBuffer,
    unsigned int inBufLength,
    unsigned short* a4,
    unsigned int outBufLength,
    unsigned long* a6,
    __int64 devExt)
{
    NTSTATUS v9; // ebx

    switch (ioctlCode)
    {
    case 0xFA002EE0:
        if (!a4 || !systemBuffer || outBufLength != inBufLength && outBufLength < 0x10)
            goto LABEL_35;
        v9 = sub_119F0(systemBuffer, devExt);
        if (STATUS_SUCCESSS(v9))
        {
            *a6 = 20;
            goto LABEL_28;
        }
        break;
    case 0xFA002EE4:
        if (!systemBuffer)
            goto LABEL_35;
        v9 = sub_11B60(systemBuffer, devExt);
        *a6 = 0;
        break;
    case 0xFA002EE8:
        if (!systemBuffer)
            goto LABEL_35;
        v9 = MapPhysical(systemBuffer);
        if (STATUS_SUCCESSS(v9))
        {
            *a6 = 20;
            memmove(a4, systemBuffer, 20i64);
        }
        break;
    case 0xFA002EEC:
        if (!a4 || !systemBuffer || outBufLength != inBufLength && outBufLength < 0x10)
            goto LABEL_35;
        v9 = VulnFunc(systemBuffer);
        if (STATUS_SUCCESSS(v9))
        {
            *a6 = 16;
            memmove(a4, systemBuffer, 16i64);
        }
        break;
    case 0xFA002EF0:
        if (!systemBuffer || inBufLength < 0x10)
            goto LABEL_35;
        v9 = VulnFunc2(systemBuffer);
        *a6 = 0;
        break;
    case 0xFA002EF8:
        if (!systemBuffer)
            goto LABEL_35;
        v9 = UnmapPhysical(*(_QWORD*)systemBuffer, *(int*)(systemBuffer + 16));
        if (STATUS_SUCCESSS(v9))
        {
            *a6 = 20;
        LABEL_28:
            memmove(a4, systemBuffer, 20i64);
        }
        break;
    case 0xFA002EFC:
        if (!systemBuffer || inBufLength < 0x16)
            goto LABEL_35;
        v9 = VulnFunc3(systemBuffer);
        *a6 = 22;
        break;
    case 0xFA002F08:
        if (!a4 && outBufLength < 4)
            goto LABEL_35;
        *a4 = 2;
        a4[1] = 3;
        *a6 = 4;
        v9 = 0;
        break;
    case 0xFA002F1C:
        if (systemBuffer && inBufLength >= 0x26)
        {
            v9 = VulnFunc4(systemBuffer);
            *a6 = 38;
        }
        else
        {
        LABEL_35:
            v9 = 0xC0000206;
        }
        break;
    default:
        v9 = 0xC000000D;
        break;
    }
    return v9;
}