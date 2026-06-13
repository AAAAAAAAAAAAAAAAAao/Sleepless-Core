function battle_add_status(_user, _status, _silent = false){
	var _found = false;
	for (var i = array_length(_user.status_effects) - 1; i >= 0; i--) {
		if (_user.status_effects[i].name == _status.name) { 
			_user.status_effects[i].turns_passed = 0;
			_found = true;
			break;
		}
	}
	if (!_found) {
		array_push(_user.status_effects, _status);
	}
	if (!_silent) {
		array_push(global.battle_log, string_ext(_status.description, [_user.name]));
	}
}