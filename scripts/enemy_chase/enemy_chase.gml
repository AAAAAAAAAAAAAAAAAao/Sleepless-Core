function enemy_chase(){
	if (instance_exists(target)) {
		x_to = target.x;
		y_to = target.y;
		
		var _distance_to_go	= point_distance(x, y, x_to, y_to);
		image_speed			= 1.0;
		dir					= point_direction(x, y, x_to, y_to);
		
		if (_distance_to_go > enemy_speed){
			hor_speed = lengthdir_x(enemy_speed, dir);
			ver_speed = lengthdir_y(enemy_speed, dir);
		}
		else {
			hor_speed = lengthdir_x(_distance_to_go, dir);
			ver_speed = lengthdir_y(_distance_to_go, dir);
		}
		
		if (hor_speed != 0) image_xscale = sign(hor_speed);
		
		enemy_tile_collision();
		
		//Перевірка колізії з гравцем
		if ((array_length(enemy_team) > 0) and (point_distance(x, y, obj_player.x, obj_player.y) <= 16)) {
			new_encounter(enemy_team, spr_bg_TEST); 
		}
	}
}