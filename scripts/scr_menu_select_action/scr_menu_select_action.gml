function menu_select_action(_user, _action){
	with (obj_menu) active = false;
	
	with (obj_battle) {
		if (_action.target_required) {
			with (cursor) {
				active 			= true;
				active_action	= _action;
				target_all 		= _action.target_all;
				if (target_all == MODE.VARIES) target_all = true;
				active_user		= _user;
				
				if (_action.target_enemy_by_default) {
					target_index 	= 0;
					target_side 	= obj_battle.enemy_units;
					active_target 	= obj_battle.enemy_units[target_index];
				}
				else {
					target_side = obj_battle.party_units;
					active_target = active_user;
					var _find_self = function (_element, _user) {
						return (_element == cursor_target)
					}
					target_index = array_find_index(obj_battle.party_units, _find_self);
				}
			}
		}
		else {
			begin_action(_user, _action, -1);
			with (obj_menu) instance_destroy();
		}
	}
}