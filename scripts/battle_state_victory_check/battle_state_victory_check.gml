function battle_state_victory_check(){
	deaths = 0;
	party_units_by_hp = party_units;
	refresh_party_health_order = function(){
		array_sort(party_units_by_hp, function(_1, _2){
			return _2.hp - _1.hp;
		});
	}
	refresh_party_health_order();
	
	refresh_enemy_health_order = function(){
		enemy_units_by_hp = [];
		array_copy(enemy_units_by_hp, 0, enemy_units, 0, array_length(enemy_units));
		array_sort(enemy_units_by_hp, function(_1, _2){
			return _2.hp - _1.hp;
		});
	}
	refresh_enemy_health_order();
	//Чи померли всі свої
	if (party_units_by_hp[0].hp <= 0) {
		transition(TRANS_TYPE.FADE, r_death_screen);
	}
	else {
		//Чи померли всі вороги
		if (enemy_units_by_hp[0].hp <= 0) {
			//Записати дані з битви до глобалів
			for (var i = 0; i < array_length(global.party); i++) {
				global.party[i].hp 	= party_units[i].hp;
				global.battle_won 	= true;
			}
		}
		else {
			battle_state = battle_state_turn_progression;
		}
	}
}