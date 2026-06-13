function battle_change_hp(_target, _amount, _alive_dead_or_either = 0, _silent = false){
	//_alive_dead_or_either = 0 для живих
	//_alive_dead_or_either = 1 для мертвих
	//_alive_dead_or_either = 2 для любих
	
	//Якщо масив:
	if(is_array(_target)){
		for (var i = 0; i < array_length(_target); i++) {
			battle_change_hp(_target[i], _amount, _alive_dead_or_either, _silent);
		}
	}
	
	else {
		//Якщо мертвий - інгоруємо
		if (!instance_exists(_target) or _target.hp <= 0) return;
		
		//Щит
		if (_amount < 0) {
			_amount = floor(_amount * (1 - (_target.defence / 100)));
			show_debug_message(_target.defence);
		}
		
		var _failed = false;
		
		
		if (_alive_dead_or_either == 0) && (_target.hp <= 0) _failed = true;
		if (_alive_dead_or_either == 1) && (_target.hp > 0) _failed = true;
			
		
		var _col = c_white;
		
		
		if (_amount > 0) _col = c_lime;
			
		if (_failed) {
			_col	= c_white;
			_amount	= "failed";
		}
		
		
		instance_create_depth(
			_target.x,
			_target.y,
			_target.depth - 1,
			obj_battle_floating_text,
			{
				font: fnt_text,
				col: _col,
				text: string(_amount)
			}
		);
		
		if (!_failed) {
			//Якщо урон
			if (_amount < 0) {
				if (!_silent) {
					array_push(global.battle_log, string_ext("{0} took {1} damage", [_target.name, -_amount]));
				}
				//шок
				if (-_amount >= _target.hp_max / 2 and -_amount < _target.hp_max) {
					battle_add_status(_target, global.status_effects.pain_shock);
				}
				//смерть
				if (clamp(_target.hp + _amount, 0, _target.hp_max) == 0) {
					array_delete(_target.status_effects, 0, array_length(_target.status_effects));
					if (!_silent) {
						array_push(global.battle_log, string_ext("{0} is knocked out", [_target.name]));
					}
				}
			}
			//якщо нічого
			else if (_amount == 0){
				if (!_silent) {
					array_push(global.battle_log, string_ext("{0} took no damage", [_target.name]));
				}
			}
			//Якщо лікування
			else {
				if (!_silent) {
					array_push(global.battle_log, string_ext("{0} recovered {1} HP", [_target.name, _amount]));
				}
			}
			_target.hp = clamp(_target.hp + _amount, 0, _target.hp_max);
		}
	}
}
