function save_settings(){
	//Створити мапу для збереження
	var _map = ds_map_create();
	
	//Заповнення
	var _keys = struct_get_names(global.settings);
	
	for (var i = 0; i < array_length(_keys); i++) {
		var _key = _keys[i];
		var _val = global.settings[$ _key];
		
		ds_map_add(_map, _key, _val);
	}
	
	//Зберегти все в string
	var _string = json_encode(_map);
	save_string_to_file("settings.data", _string);
	show_debug_message(_string);
	
	//Звільнення пам'яті
	ds_map_destroy(_map);
	show_debug_message("Settings saved.");
}