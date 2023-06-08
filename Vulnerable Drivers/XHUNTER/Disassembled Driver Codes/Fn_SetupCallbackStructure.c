
struct CallbackStructs {
	uint64_t Index;
	PVOID FnPtr;
};


auto Fn_SetupCallbackStructure() -> NTSTATUS {

    CallbackStructs callback_structs[22]{};
	
	callback_structs[0].Index = 0x306; callback_structs[0].FnPtr = &sub_14000103C;
	callback_structs[1].Index = 0x775; callback_structs[1].FnPtr = &sub_140001000;
	callback_structs[2].Index = 0x776; callback_structs[2].FnPtr = &sub_140001B10;
	callback_structs[3].Index = 0x777; callback_structs[3].FnPtr = &sub_140001A44;
	callback_structs[4].Index = 0x778; callback_structs[4].FnPtr = &sub_140001B94;
	callback_structs[5].Index = 0x779; callback_structs[5].FnPtr = &sub_140001998;
	callback_structs[6].Index = 0x790; callback_structs[6].FnPtr = &sub_140001A84;
	callback_structs[7].Index = 0x782; callback_structs[7].FnPtr = &sub_140001B4C;
	callback_structs[8].Index = 0x783; callback_structs[8].FnPtr = &sub_140001268;
	callback_structs[9].Index = 0x785; callback_structs[9].FnPtr = &sub_1400017C0;
	callback_structs[10].Index = 0x786; callback_structs[10].FnPtr = &sub_14000122C;
	callback_structs[11].Index = 0x787; callback_structs[11].FnPtr = &sub_1400018BC;
	callback_structs[12].Index = 0x788; callback_structs[12].FnPtr = &sub_14000181C;
	callback_structs[13].Index = 0x789; callback_structs[13].FnPtr = &sub_140001110;
	callback_structs[14].Index = 0x791; callback_structs[14].FnPtr = &sub_140001720;
	callback_structs[15].Index = 0x792; callback_structs[15].FnPtr = &sub_140001374;
	callback_structs[16].Index = 0x793; callback_structs[16].FnPtr = &sub_140001434;
	callback_structs[17].Index = 0x794; callback_structs[17].FnPtr = &sub_1400012A4;
	callback_structs[18].Index = 0x796; callback_structs[18].FnPtr = &sub_140001150;
	callback_structs[19].Index = 0x797; callback_structs[19].FnPtr = &sub_1400013F8;
	callback_structs[20].Index = 0x798; callback_structs[20].FnPtr = &sub_140001060;
	callback_structs[21].Index = 0x799; callback_structs[21].FnPtr = &sub_1400014B8;

	return STATUS_SUCCESS;
}