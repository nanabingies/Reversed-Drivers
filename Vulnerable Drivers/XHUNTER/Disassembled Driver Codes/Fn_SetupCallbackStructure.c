
struct CallbackStructs {
	uint64_t Index;
	PVOID FnPtr;
};

#pragma once

auto Fn_SetupCallbackStructure() -> NTSTATUS {
	
	CallbackUtils::callback_structs[0].Index = 0x306; CallbackUtils::callback_structs[0].FnPtr = &sub_14000103C;
	CallbackUtils::callback_structs[1].Index = 0x775; CallbackUtils::callback_structs[1].FnPtr = &sub_140001000;
	CallbackUtils::callback_structs[2].Index = 0x776; CallbackUtils::callback_structs[2].FnPtr = &sub_140001B10;
	CallbackUtils::callback_structs[3].Index = 0x777; CallbackUtils::callback_structs[3].FnPtr = &sub_140001A44;
	CallbackUtils::callback_structs[4].Index = 0x778; CallbackUtils::callback_structs[4].FnPtr = &sub_140001B94;
	CallbackUtils::callback_structs[5].Index = 0x779; CallbackUtils::callback_structs[5].FnPtr = &sub_140001998;
	CallbackUtils::callback_structs[6].Index = 0x790; CallbackUtils::callback_structs[6].FnPtr = &sub_140001A84;
	CallbackUtils::callback_structs[7].Index = 0x782; CallbackUtils::callback_structs[7].FnPtr = &sub_140001B4C;
	CallbackUtils::callback_structs[8].Index = 0x783; CallbackUtils::callback_structs[8].FnPtr = &sub_140001268;
	CallbackUtils::callback_structs[9].Index = 0x785; CallbackUtils::callback_structs[9].FnPtr = &sub_1400017C0;
	CallbackUtils::callback_structs[10].Index = 0x786; CallbackUtils::callback_structs[10].FnPtr = &sub_14000122C;
	CallbackUtils::callback_structs[11].Index = 0x787; CallbackUtils::callback_structs[11].FnPtr = &sub_1400018BC;
	CallbackUtils::callback_structs[12].Index = 0x788; CallbackUtils::callback_structs[12].FnPtr = &sub_14000181C;
	CallbackUtils::callback_structs[13].Index = 0x789; CallbackUtils::callback_structs[13].FnPtr = &sub_140001110;
	CallbackUtils::callback_structs[14].Index = 0x791; CallbackUtils::callback_structs[14].FnPtr = &sub_140001720;
	CallbackUtils::callback_structs[15].Index = 0x792; CallbackUtils::callback_structs[15].FnPtr = &sub_140001374;
	CallbackUtils::callback_structs[16].Index = 0x793; CallbackUtils::callback_structs[16].FnPtr = &sub_140001434;
	CallbackUtils::callback_structs[17].Index = 0x794; CallbackUtils::callback_structs[17].FnPtr = &sub_1400012A4;
	CallbackUtils::callback_structs[18].Index = 0x796; CallbackUtils::callback_structs[18].FnPtr = &sub_140001150;
	CallbackUtils::callback_structs[19].Index = 0x797; CallbackUtils::callback_structs[19].FnPtr = &sub_1400013F8;
	CallbackUtils::callback_structs[20].Index = 0x798; CallbackUtils::callback_structs[20].FnPtr = &sub_140001060;
	CallbackUtils::callback_structs[21].Index = 0x799; CallbackUtils::callback_structs[21].FnPtr = &sub_1400014B8;

	return STATUS_SUCCESS;
}