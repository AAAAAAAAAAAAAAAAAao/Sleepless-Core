if (instance_exists(obj_player) and (position_meeting(obj_player.x, obj_player.y, id))){
	global.target_room		= target_room;
	global.target_x			= target_x;
	global.target_y			= target_y
	global.target_direction	= obj_player.direction;
	
	with (obj_player) state = player_state_trasition();
	transition(TRANS_TYPE.FADE, target_room);
	
	instance_destroy();
}