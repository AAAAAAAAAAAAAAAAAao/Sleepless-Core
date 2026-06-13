function begin_action(_user, _action, _targets){
	current_user	= _user;
	current_action	= _action;
	current_targets	= _targets;
	
	if (!is_array(current_targets)) current_targets = [current_targets];
		
	battle_wait_time_remaining = battle_wait_time_frames;
	
	with (_user){
		acting = true;
		
		//Якщо нема анімації - буде  без анімації
		if (!is_undefined(_action[$ "user_animation"])) && (!is_undefined(_user.sprites[$ _action.user_animation])) {
			sprite_index	= sprites[$ _action.user_animation];
			image_index		= 0;
		}
	}
	
	if (!current_action.target_required) {
		array_push(global.battle_log, string_ext(_action.description, [_user.name]));
	}
	else if (array_length(current_targets) == 1) {
		array_push(global.battle_log, string_ext(_action.description, [_user.name, current_targets[0].name]));
	}
	else {
		array_push(global.battle_log, string_ext(_action.description, [_user.name, "multiple targets"]));
	}
	
	if (current_action == global.action_library.attack and !_user.enemy) {
		battle_state = battle_state_aiming;
		global.aim_target = _targets;
		global.aim_user = _user;
	}
	else {
		battle_state = battle_state_perform_action;
	}
}
