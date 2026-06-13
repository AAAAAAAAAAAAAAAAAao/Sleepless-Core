global.enemies = {
	TEST_bad_thing: {
		enemy: 					true,
		name:					"Bad Thing",
		hp:						10,
		hp_max:					10,
		ep:						10,
		ep_max:					10,
		ep_recorery_per_turn: 	1,
		atk:					1,
		sprites: 				{	idle: 	TEST_spr_enemy_battle_idle, 
									attack: TEST_spr_enemy_battle_attack, 
									defend: TEST_spr_enemy_battle_defend, 
									down: 	TEST_spr_enemy_battle_down,
									facing: TEST_spr_enemy_battle_facing
								},
		actions: 				[global.action_library.standby, global.action_library.attack],
		status_effects:			[],
		xp_value: 				1,
		drops:					[],
		ai_script: 				function (){
			//Атакувати рандомного друга
			var _action = actions[0];
			if (ep > 0) {
				_action	= actions[1];
			}
			var _possible_targets	= array_filter(obj_battle.party_units, function(_unit, _index){return (_unit.hp > 0);});
			var _target				= _possible_targets[irandom(array_length(_possible_targets) - 1)];
			
			if (array_length(_possible_targets) == 0) {
				return [actions[0], noone];
			}
			
			return [_action, _target];
		},
		evade_script:			function (_enemy_x, _enemy_y, _enemy_x_to, _enemy_y_to, _i, _time_passed, _gun_restrict_x1, _gun_restrict_x2, _gun_restrict_y1, _gun_restrict_y2) {
			switch (_i) {
				case 0: return lerp(_enemy_x, _enemy_x_to, 0.05);
				case 1: return lerp(_enemy_y, _enemy_y_to, 0.05);
				
				case 2: if (_time_passed % 90 == 0) and (!array_contains(status_effects, global.status_effects.unconscious)) return clamp(random_range(_enemy_x - 25, _enemy_x + 25),  _gun_restrict_x1, _gun_restrict_x2);
				case 3: if (_time_passed % 90 == 0) and (!array_contains(status_effects, global.status_effects.unconscious)) return clamp(random_range(_enemy_y - 25, _enemy_y + 25), _gun_restrict_y1, _gun_restrict_y2);
			}
		}
	},
	TEST_fragile_thing: {
		enemy: 					true,
		name:					"Frg Thing",
		hp:						1,
		hp_max:					1,
		ep:						10,
		ep_max:					10,
		ep_recorery_per_turn: 	1,
		atk:					3,
		sprites: 				{	idle: 	TEST_spr_ragile_thing_battle_idle, 
									attack: TEST_spr_ragile_thing_battle_attack, 
									defend: TEST_spr_ragile_thing_battle_defend, 
									down: 	TEST_spr_ragile_thing_battle_down,
									facing: TEST_spr_ragile_thing_battle_facing
								},
		actions: 				[global.action_library.standby, global.action_library.attack],
		status_effects:			[],
		xp_value: 				3,
		drops:					[],
		ai_script: 				function (){
			//Атакувати рандомного друга
			var _action = actions[0];
			if (ep > 0) {
				_action	= actions[1];
			}
			var _possible_targets	= array_filter(obj_battle.party_units, function(_unit, _index){return (_unit.hp > 0);});
			var _target				= _possible_targets[irandom(array_length(_possible_targets) - 1)];
			
			return [_action, _target];
		},
		evade_script:			function (_enemy_x, _enemy_y, _enemy_x_to, _enemy_y_to, _i, _time_passed, _gun_restrict_x1, _gun_restrict_x2, _gun_restrict_y1, _gun_restrict_y2) {
			switch (_i) {
				case 0: return lerp(_enemy_x, _enemy_x_to, 0.05);
				case 1: return lerp(_enemy_y, _enemy_y_to, 0.05);
				
				case 2: if (_time_passed % 90 == 0) and (!array_contains(status_effects, global.status_effects.unconscious)) return clamp(random_range(_enemy_x - 25, _enemy_x + 25),  _gun_restrict_x1, _gun_restrict_x2);
				case 3: if (_time_passed % 90 == 0) and (!array_contains(status_effects, global.status_effects.unconscious)) return clamp(random_range(_enemy_y - 25, _enemy_y + 25), _gun_restrict_y1, _gun_restrict_y2);
			}
		}
	}
}