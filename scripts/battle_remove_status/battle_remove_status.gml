function battle_remove_status(_user, _status, _silent = false){
	for (var i = array_length(_user.status_effects) - 1; i >= 0; i--) {
		if (_user.status_effects[i].name == _status.name) { 
			_user.status_effects[i].func_gone(_user);
			array_delete(_user.status_effects, i, 1);
			break;
		}
	}
	if (!_silent) {
		array_push(global.battle_log, string_ext(_status.description_gone, [_user.name]));
	}
}