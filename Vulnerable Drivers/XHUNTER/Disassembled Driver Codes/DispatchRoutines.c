#pragma once

auto Fn_IRP_MJ_CREATE(_In_ PDEVICE_OBJECT DeviceObject, _In_ PIRP Irp) -> NTSTATUS {
	InterlockedIncrement((volatile long*)dword_14000A498);
	Irp->IoStatus.Status = STATUS_SUCCESS;
	Irp->IoStatus.Information = 0;
	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	return STATUS_SUCCESS;
}


auto Fn_IRP_MJ_CLOSE(_In_ PDEVICE_OBJECT DeviceObject, _In_ PIRP Irp) -> NTSTATUS {
	auto ns = sub_140002E60(PsGetCurrentProcessId());
	InterlockedAdd((volatile long*)dword_14000A498, 0xFFFFFFFF);
	if (ns == STATUS_SUCCESS) {
		ZwUnloadDriver(&xmmword_14000A4F0);
	}

	Irp->IoStatus.Status = STATUS_SUCCESS;
	Irp->IoStatus.Information = 0;
	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	return STATUS_SUCCESS;
}


auto Fn_IRP_MJ_WRITE(_In_ PDEVICE_OBJECT DeviceObject, _In_ PIRP Irp) -> NTSTATUS {
	auto io_stack_location = IoGetCurrentIrpStackLocation(Irp);
	xigncode_write_request* xwr = reinterpret_cast<xigncode_write_request*>(Irp->AssociatedIrp.SystemBuffer);
	NTSTATUS nt_status = STATUS_UNSUCCESSFUL;
	BYTE var_318[0x300];
	PVOID var_320, var_330;

	if ((io_stack_location->Parameters.Write.Length != 0x270) || (xwr->size != 0x270) || (xwr->magic_num != 0x345821AB)) {
		goto end;
	}

	sub_140001BD4(xwr, &var_318);
	var_330 = sub_1400036F0(xwr->output_buffer_addr, 0x2FA, &var_320);
	if (var_330 == nullptr) {
		goto end;
	}

	int count = 5;
	do {
		*(PVOID*)var_330 = *(PVOID*)var_318;
		*(PVOID*)((UCHAR*)var_330 + 0x10) = *((PVOID*)v9 + 1);
		*(PVOID*)((UCHAR*)var_330 + 0x20) = *((PVOID*)v9 + 2);
		*(PVOID*)((UCHAR*)var_330 + 0x30) = *((PVOID*)v9 + 3);
		*(PVOID*)((UCHAR*)var_330 + 0x40) = *((PVOID*)v9 + 4);
		*(PVOID*)((UCHAR*)var_330 + 0x50) = *((PVOID*)v9 + 5);
		*(PVOID*)((UCHAR*)var_330 + 0x60) = *((PVOID*)v9 + 6);
		
		var_330 = (var_330 + 0x60);
		var_330 += 0x80i64;
		*(PVOID*)(v8 - 16) = *((_OWORD*)v9 + 7);
		v9 += 0x80;
		--count;
	} while (count > 0);


end:
	Irp->IoStatus.Status = nt_status;
	Irp->IoStatus.Information = 0;
	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	return nt_status;
}
