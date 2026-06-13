function enemy_wander(){
	sprite_index = spr_move;
	
	//прийшов або покинув
	if ((x == x_to) && (y == y_to)) || (time_passed > enemy_wander_distance / enemy_speed){
		hor_speed = 0;
		ver_speed = 0;
		
		if (image_index < 1){
			image_speed = 0.0;
			image_index = 0;
		}
		
		if (++wait >= wait_duration){
			wait		= 0;
			time_passed	= 0;
			dir			= point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			x_to		= x + lengthdir_x(enemy_wander_distance, dir);
			y_to		= y + lengthdir_y(enemy_wander_distance, dir);
		}
	}
	//до нової позиції
	else{
		time_passed++;
		image_speed				= 1.0;
		var _distance_to_go		= point_distance(x, y, x_to, y_to);
		var _speed_this_frame	= enemy_speed;
		if (_distance_to_go < enemy_speed) _speed_this_frame = _distance_to_go;
		dir			= point_direction(x, y, x_to, y_to);
		hor_speed	= lengthdir_x(_speed_this_frame, dir);
		ver_speed	= lengthdir_y(_speed_this_frame, dir);
		if (hor_speed != 0) image_xscale = sign(hor_speed);
		
		//колізія
		enemy_tile_collision();
		
	}
	
	//Перевірка нападу
	if (++agro_check >= agro_check_duration){
		if (instance_exists(obj_player)) && (point_distance(x, y, obj_player.x, obj_player.y) <= enemy_agro_radius){
			state = ENEMY_STATE.CHASE;
			target = obj_player;
		}
	}
	
}