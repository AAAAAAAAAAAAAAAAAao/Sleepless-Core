function enemy_tile_collision(){
	if (tilemap_get_at_pixel(collision_map, x + hor_speed, y)){
		x -= x mod TILE_SIZE;
		if (sign(hor_speed) == 1) x += TILE_SIZE - 1;
		hor_speed = 0;
		_collision = true;
	}
	x += hor_speed;
	if(tilemap_get_at_pixel(collision_map, x, y + ver_speed)){
		y -= y mod TILE_SIZE;
		if (sign(ver_speed) == 1) y += TILE_SIZE -1;
		ver_speed = 0;
		_collision = true;
	}
	y += ver_speed;

}