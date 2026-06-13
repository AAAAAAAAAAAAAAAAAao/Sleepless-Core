function battle_state_turn_progression(){
	battle_text = "";
	turn++;
	
	if (turn > array_length(units) - 1){
		turn = 0;
		round_count++;
		array_push(global.battle_log, string_ext("---Turn {0}---", [round_count]));
	}
	
	battle_state = battle_state_select_action;
}