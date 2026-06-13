if (!global.game_paused){
	//пригання
	if (bounce_count != 0){
		bounce += (pi * bounce_speed);
		if (bounce > pi){
			bounce			-= pi;
			bounce_height	*= 0.6;
			bounce_count	--;
		}
		z = sin(bounce) * bounce_height;
	}
	else z = 0;
	
	//зникнення
	deteriorate ++;
	if (deteriorate > deteriorate_after){
		image_alpha -= 1/deteriorate_time;
		if (image_alpha <= 0) instance_destroy();
	}
	
	//тертя
	friction1 = 0.05;
	if (z == 0) friction1 = 0.1;
	
	//переміщення
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	
	if (tilemap_get_at_pixel(collision_map, x, y) > 0) spd = 0;
	spd = max(spd - friction1, 0);
}