function player_throw(){
	with (global.ins_lifted){
		lifted		= false;
		persistent	= false;
		thrown		= true;
		
		z							= 30;
		throw_peak_height			= z + 25;
		throw_distance				= entity_throw_distance;
		throw_distance_travelled	= 0;
		throw_start_percent			= (25 / throw_peak_height) * 0.5;
		throw_percent				= throw_start_percent;
		direction					= other.direction;
		xstart						= x;
		ystart						= y;
	}
	player_act_out_animation(spr_mike_PJ_throwing);
	global.ins_lifted = noone;
	
	sprite_standing = spr_mike_PJ_standing;
	sprite_walk 	= spr_mike_PJ_walking;
}