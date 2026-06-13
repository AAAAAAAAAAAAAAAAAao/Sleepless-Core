function player_act_out_animation(_sprite_index, _animation_end_script = -1){
	///desc player_act_out_animation(sprite, end_script)
	///@arg sprite
	///@arg end_script
	
	//Для анімацій та дій після них.
	
	state = player_state_act;
	sprite_index = _sprite_index;
	if (_animation_end_script != -1) animation_end_script = _animation_end_script;
	local_frame = 0;
	image_index	= 0;
	player_animate_sprite();
}