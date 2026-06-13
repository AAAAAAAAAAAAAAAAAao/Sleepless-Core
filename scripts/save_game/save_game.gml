function save_game(){
	//Створити мапу для збереження
	var _map = ds_map_create();
	
	//Заповнення
	_map[? "room"] 			= room;
	_map[? "party_hp_1"] 	= global.party[0].hp;
	
	//В DS мапи ds мапи не записуються. Треба копіювати дані всередині окремо
	var _quest_map = ds_map_create();
	ds_map_copy(_quest_map, global.quest_status);
	ds_map_add_map(_map, "quest_status", _quest_map);	//Сам в шоці
	
	//Зберегти все в string
	var _string = json_encode(_map);
	save_string_to_file("save" + string(global.game_save_slot) + ".save", _string);
	show_debug_message(_string);
	
	//Звільнення пам'яті
	ds_map_destroy(_map);
	show_debug_message(string_ext("game saved. Slot: {0}", [global.game_save_slot]));
}