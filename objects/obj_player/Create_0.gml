//Стани
state      = player_state_free;
last_state = state;
//переміщення
image_speed				= 0;
hor_speed				= 0;
ver_speed				= 0;
speed_walk				= 2.0;	
speed_run_multiplier	= 1.5;
z						= 0;

animation_end_script	= -1;



//колізія
collision_map = layer_tilemap_get_id(layer_get_id("collision"));

//анімація
sprite_walk     = spr_mike_PJ_walking;
sprite_standing = spr_mike_PJ_standing;
local_frame     = 0;

flash = 0;

if (global.target_x != -1){
	x			= global.target_x;
	y			= global.target_y;
	direction	= global.target_direction;
}

if (global.ins_lifted != noone) {
	sprite_standing = spr_mike_PJ_lifting;
	sprite_walk		= spr_mike_PJ_lifting_walking;
	sprite_index 	= sprite_standing;
}