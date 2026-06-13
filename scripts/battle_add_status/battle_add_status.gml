function battle_add_status(_target, _status, _silent = false){
	if (is_array(_target)) {
		//Скопіювати всі цілі в новий масив
		var _sub_targets = [];
		array_copy(_sub_targets, 0, _target, 0, array_length(_target));
		show_debug_message(_sub_targets);
		
		//Та використати функцію для кожного
		for (var i = 0; i < array_length(_sub_targets); i++) {
			battle_add_status(_sub_targets[i], _status, _silent);
		}
	}
	
	else{
		//Перевірка на мертвяків
		if (!instance_exists(_target) or _target.hp <= 0) return;
		
		var _found = false;
		for (var i = array_length(_target.status_effects) - 1; i >= 0; i--) {
			if (_target.status_effects[i].name == _status.name) { 
				_target.status_effects[i].turns_passed = 0;
				_found = true;
				break;
			}
		}
		if (!_found) {
			var _new_status = variable_clone(_status);
			_new_status.turns_passed = 0;
			array_push(_target.status_effects, _new_status);
		}
		if (!_silent) {
			array_push(global.battle_log, string_ext(_status.description, [_target.name]));
		}
	}
}