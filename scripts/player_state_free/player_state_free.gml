function player_state_free(){
    //переміщення
    var _speed = speed_walk;
    if (key_run){
        _speed *= speed_run_multiplier;
    }
    hor_speed = lengthdir_x(input_magnitude*_speed, input_direction);
    ver_speed = lengthdir_y(input_magnitude*_speed, input_direction);
    
    player_collision();
    
	
	
	
    //анімація
    var _old_sprite = sprite_index;
    
    if (input_magnitude!=0){
        direction    = input_direction;
        sprite_index = sprite_walk;
    }
    else{
        sprite_index = sprite_standing;
    }
    if (_old_sprite != sprite_index){
        local_frame  = 0;
    }
    player_animate_sprite();
    
	
	
	
    //Кнопки
    
    if (key_confirm){ //взаємодія
        var _activate_x		= x + lengthdir_x(10, direction);
        var _activate_y		= y + lengthdir_y(10, direction);
        var _activate_size	= 8;
		var _activate_list	= ds_list_create();
			activate		= noone;
		var _entities_found	= collision_rectangle_list(
			_activate_x - _activate_size,
			_activate_y - _activate_size,
			_activate_x + _activate_size,
			_activate_y + _activate_size,
			obj_parent_entity,
			false,
			true,
			_activate_list,
			true
		);
		
		//Перевірка, об'єктів
		while (_entities_found > 0){
			var _check = _activate_list[| --_entities_found];
			if (_check != global.ins_lifted) && (_check.entity_activate_script){
				activate = _check;
				break;
				
			}
		}
		
		
		ds_list_destroy(_activate_list);
		
        if (activate and activate.entity_activate_script){
            script_execute_array(activate.entity_activate_script, activate.entity_activate_args);
             //Якщо NPC, нехай дивиться на нас
            if (activate.entity_NPC){
                with (activate){
                    direction	= point_direction(x, y, other.x, other.y);
                    image_index = CARRIDAL_DIR;
                }
            }
        }
		else {
			//кидання, якщо є що киинути
			if(global.ins_lifted){
				player_throw();
			}
		}
    }
	if (key_bomb) and (global.player_has_any_items) and (global.player_equiped != TEST_ITEM.NONE) {
		switch (global.player_equiped) {
			case TEST_ITEM.BOMB: use_item_bomb(); break;
				default: break;
		}
	}
}