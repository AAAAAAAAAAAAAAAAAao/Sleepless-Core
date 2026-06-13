function load_settings(){
	var _file = "settings.data";
	
	if (!file_exists(_file)) {
		show_debug_message("Settings not found. Loading default");
		return false;
	}
	
	var _map = load_json_from_file(_file);
	
	if (_map != -1) {
		var _keys = ds_map_keys_to_array(_map);
		
		for (var i = 0; i < array_length(_keys); i++) {
			var _key = _keys[i];
			
			global.settings[$ _key] = _map[? _key];
		}
		
		ds_map_destroy(_map);
		show_debug_message("Settings loaded.");
	}
	else show_debug_message("Settings file corrupted");
}