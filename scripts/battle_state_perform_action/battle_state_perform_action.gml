function battle_state_perform_action(){
	if (current_user.acting){
		var _conscious = true;
		for (var i = array_length(current_user.status_effects) - 1; i >= 0; i--) {
			if (current_user.status_effects[i].name == global.status_effects.unconscious.name) { 
				_conscious = false; 
			}
		}
		if (current_user.image_index >= current_user.image_number - 1){
			with (current_user){
				
				if (_conscious) {
					sprite_index = sprites.idle;
				}
				else {
					sprite_index = sprites.down;
				}
				image_index	= 0;
				acting		= false;
			}
			if (variable_struct_exists(current_action, "effect_sprite")){
				if (current_action.effect_on_target == MODE.ALWAYS) || ((current_action.effect_on_target == MODE.VARIES) && (array_length(current_targets) <= 1)) {
					for (var i = 0; i < array_length(current_targets); i++){
						instance_create_depth(current_targets[i].x, current_targets[i].y, current_targets[i].depth - 1, obj_battle_effect, {sprite_index : current_action.effect_sprite});
					}
				}
				else {
					var _effect_sprite = current_action.effect_sprite;
					if (variable_struct_exists(current_action, "effect_sprite_no_target")) _effect_sprite = current_action.effect_sprite_no_target;
						
					instance_create_depth(x, y, depth - 100, obj_battle_effect, {sprite_index : _effect_sprite});
				}
			}
			//Якщо достатньо енергії
			if (variable_struct_exists(current_action, "ep_cost")) {
				if (current_action.ep_cost <= current_user.ep) {
					if (current_action.target_required) {
						current_action.func(current_user, current_targets);
					}
					else {
						current_action.func(current_user);
					}
				}
				//Якщо недостатньо енергії
				else {
					var _user_ep = current_user.ep;
					var _action_ep = current_action.ep_cost;
					var _ep_missing_percent = 100 - ((_user_ep * 100) / _action_ep);
					var _success_chance = clamp(50 - _ep_missing_percent, 0, 50);
					var _roll = irandom_range(0, 100);
					if (_roll >= _success_chance) {
						if (current_action.target_required) {
							current_action.func(current_user, current_targets);
						}
						else {
							current_action.func(current_user);
						}
					}
					else {
						array_push(global.battle_log, string_ext("{0} failed to use {1}", [current_user.name, current_action.name]));
					}
				}
			}
			//предмети
			else {
				if (current_action.target_required) {
					current_action.func(current_user, current_targets);
				}
				else {
					current_action.func(current_user);
				}
				global.items[$ current_action.name].count--;
			}
			// Пасивний приріст енергії
			if (current_user.hp > 0) and (current_user.ep < current_user.ep_max) {
				battle_change_ep(current_user, current_user.ep_recorery_per_turn);
			}
		}
	}
	else {
		if (!instance_exists(obj_battle_effect)){
			battle_wait_time_remaining--;
			if (battle_wait_time_remaining == 0) battle_state = battle_state_victory_check;
		}
	}
}