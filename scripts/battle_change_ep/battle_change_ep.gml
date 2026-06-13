function battle_change_ep(_target, _amount, _silent = false){
	var _past_ep = _target.ep;
	_target.ep = clamp(_target.ep + _amount, 0, _target.ep_max);
	var _wasted_ep = _target.ep - _past_ep; 
	if (!_silent) {
		if (_wasted_ep < 0) {
			array_push(global.battle_log, string_ext("{0} lost {1} EP", [_target.name, - _wasted_ep]));
		}
		else if (_wasted_ep > 0) {
			array_push(global.battle_log, string_ext("{0} recovered {1} EP", [_target.name, _wasted_ep]));
		} 
	}
}