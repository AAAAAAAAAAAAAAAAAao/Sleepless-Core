function battle_state_aiming(){
	if (aim_window_id == noone) {
		aim_window_id = instance_create_depth(
			x,
			y,
			depth - 10,
			obj_aim_window
		);
	}
	if (!instance_exists(aim_window_id)) {
		aim_window_id = noone;
		battle_state = battle_state_perform_action;
	}
}
