function load_game(_slot){
	global.game_save_slot = _slot;
	var _file = "save" + string(global.game_save_slot) + ".save";
	
	if (file_exists(_file)) {
		var _json = load_json_from_file(_file);
		
		//Повернути дані
		global.party[0].hp 	= _json[? "party_hp_1"];
		
		//Масиви
		
		
		/*
		Як повертати DS_map -и
		for (var i = 0; i < TEST_ITEM.TYPE_COUNT; i++) {
			global.player_item_unlocked[i] = _json[? "player_items_unlocked"][| i];
		}
		*/
		
		//Квести
		ds_map_copy(global.quest_status, _json[? "quest_status"]);
		
		//Кімната
		transition(TRANS_TYPE.SLIDE, _json[? "room"]);
		ds_map_destroy(_json);
		
		show_debug_message(string_ext("game loaded. Slot: {0}", [global.game_save_slot]));
		
		return true;
	}
	else {
		show_debug_message("Нема збереження");
		show_debug_message(string_ext("game started. Slot: {0}", [global.game_save_slot]));
		
		return false;
	}
}