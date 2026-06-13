function player_collision(){
    var _collision	 = false;
	var _entity_list = ds_list_create();
    
    //горизонтальна колізія
    if (tilemap_get_at_pixel(collision_map, x+hor_speed, y)){
        x -= x mod TILE_SIZE;
        if (sign(hor_speed)==1){
            x += TILE_SIZE-1;
        }
        hor_speed  = 0;
        _collision = true;
    }
	//горизонтальні сутності
	var _entity_count = instance_position_list(x + hor_speed, y, obj_parent_entity, _entity_list, false);
	var _snap_x;
	while (_entity_count > 0){
		
		var _entity_check = _entity_list[| 0];
		if (_entity_check.entity_collision == true){
			if (_entity_check.entity_colision_script != -1){
				with (_entity_check){
					script_execute(entity_colision_script);
				}
			}
			else{
				//наблизитись якнайближче
				if (sign(hor_speed) == -1) _snap_x = _entity_check.bbox_right + 1;
				else _snap_x = _entity_check.bbox_left - 1;
			
				x				= _snap_x;
				hor_speed		= 0;
				_collision		= true;
				_entity_count	= 0;
			}
		}
		ds_list_delete(_entity_list, 0);
		_entity_count --;
	}
    x += hor_speed;
    
	ds_list_clear(_entity_list);
	
    //вертикальна колізія
    if (tilemap_get_at_pixel(collision_map, x, y+ver_speed)){
        y -= y mod TILE_SIZE;
        if (sign(ver_speed)==1){
            y += TILE_SIZE-1;
        }
        ver_speed  = 0;
        _collision = true;
    }
	//вертикальні сутності
	var _entity_count = instance_position_list(x, y + ver_speed, obj_parent_entity, _entity_list, false);
	var _snap_y;
	while (_entity_count > 0){
		
		var _entity_check = _entity_list[| 0];
		if (_entity_check.entity_collision == true){
			if (_entity_check.entity_colision_script != -1){
				with (_entity_check){
					script_execute(entity_colision_script);
				}
			}
			else{
				//наблизитись якнайближче
				if (sign(ver_speed) == -1) _snap_y = _entity_check.bbox_bottom + 1;
				else _snap_y = _entity_check.bbox_top - 1;
			
				y				= _snap_y;
				ver_speed		= 0;
				_collision		= true;
				_entity_count	= 0;
			}
		}
		ds_list_delete(_entity_list, 0);
		_entity_count --;
	}
    y += ver_speed;
    
	ds_list_destroy(_entity_list);
	
    return _collision;
}