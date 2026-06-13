function battle_state_turn_progression(){
	battle_text = "";
	turn++;
	
	//Якщо Маша остання в команді
	//Підрахунок живих
	var _is_alive = [];
	var _allive_count = 0;
	for (var i = 0; i < array_length(party_units); i++) {
		if (party_units[i].hp > 0) {
			_is_alive[i] = true;
			_allive_count++;
		}
		else _is_alive[i] = false;
	}
	
	if (_allive_count == 1) {
		show_debug_message("Last one standing")
		if (global.party[1].hp > 0) {
			var _silent = false;
			//Оновлювати стан, але не сповіщати про це
			if (array_contains(global.party[1].status_effects, global.status_effects.ATK_buff50)) {
					_silent = true;
			}
			battle_add_status(global.party[1], global.status_effects.ATK_buff50, _silent);
		}
	}
	//Коли хтось інший відродився 
	else {
		for (var i = 0; i < array_length(units); i++) {
			if (units[i].name == global.party[1].name and array_contains(global.party[1].status_effects, global.status_effects.ATK_buff50)) {
				battle_remove_status(units[i], global.status_effects.ATK_buff50);
			}
		}
	}
	
	if (turn > array_length(units) - 1){
		turn = 0;
		round_count++;
		array_push(global.battle_log, string_ext("---Turn {0}---", [round_count]));
	}
	
	battle_state = battle_state_select_action;
}