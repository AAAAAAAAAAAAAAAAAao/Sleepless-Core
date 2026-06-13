if (!global.game_paused) {
	
	image_speed = 1.0;
	
	//Задіти штучки
	if (image_index == 0) {
		var _entity_list 	= ds_list_create();
		var _entity_count 	= instance_place_list(x, y,obj_parent_entity, _entity_list, false);
		var _entity 		= noone;
		
		while (_entity_count > 0) {
			_entity = _entity_list[| 0];
			if (ds_list_find_index(collision_history, _entity) == -1) {
				with (_entity) {
					if (entity_hit_script != -1) script_execute(entity_hit_script);
				}
				ds_list_add(collision_history, _entity);
			}
			ds_list_delete(_entity_list, 0);
			_entity_count--;
		}
		ds_list_destroy(_entity_list);
	}
}
else image_speed = 0.0; 