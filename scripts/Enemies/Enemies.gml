global.enemies = {
	TEST_bad_thing: 	{
		enemy: 					true,
		name:					"Bad Thing",
		hp:						10,
		hp_max:					10,
		ep:						10,
		ep_max:					10,
		ep_recorery_per_turn: 	1,
		atk:					1,
		defence:				0,
		
		base_stats: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	1,
			atk:					1,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	1,
			atk:					1,
			defence:				0
		},
		
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
		defence:				0,
		
		
		base_stats: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	1,
			atk:					3,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	1,
			atk:					3,
			defence:				0
		},
		
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
	},
	
	jiggler: 			{
		enemy: 					true,
		name:					"Jiggler",
		hp:						5,
		hp_max:					5,
		ep:						1,
		ep_max:					1,
		ep_recorery_per_turn: 	1,
		atk:					1,
		defence:				0,
		
		base_stats: {
			hp_max:					5,
			ep_max:					1,
			ep_recorery_per_turn: 	1,
			atk:					1,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					5,
			ep_max:					1,
			ep_recorery_per_turn: 	1,
			atk:					1,
			defence:				0
		},
		
		sprites: 				{	idle: 	spr_jiggler_battle_idle, 
									attack: spr_jiggler_battle_attack, 
									defend: spr_jiggler_battle_defend, 
									down: 	spr_jiggler_battle_down,
									facing: spr_jiggler_battle_facing
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
			
			return [_action, _target];
		},
		evade_script:			function (_enemy_x, _enemy_y, _enemy_x_to, _enemy_y_to, _i, _time_passed, _gun_restrict_x1, _gun_restrict_x2, _gun_restrict_y1, _gun_restrict_y2) {
			switch (_i) {
				case 0: if (!array_contains(status_effects, global.status_effects.unconscious)) return clamp(_enemy_x + irandom(10) - 5, _gun_restrict_x1, _gun_restrict_x2);
				case 1: if (!array_contains(status_effects, global.status_effects.unconscious)) return clamp(_enemy_y + irandom(10) - 5, _gun_restrict_y1, _gun_restrict_y2);
				
				case 2: return;
				case 3: return;
			}
		}
	},
	sniper: 			{
		enemy: 					true,
		name:					"Sniper",
		hp:						5,
		hp_max:					5,
		ep:						1,
		ep_max:					2,
		ep_recorery_per_turn: 	5,
		atk:					3,
		defence:				0,
		
		base_stats: {
			hp_max:					5,
			ep_max:					2,
			ep_recorery_per_turn: 	1,
			atk:					3,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					5,
			ep_max:					2,
			ep_recorery_per_turn: 	1,
			atk:					3,
			defence:				0
		},
		
		sprites: 				{	idle: 	spr_sniper_battle_idle, 
									attack: spr_sniper_battle_attack, 
									defend: spr_sniper_battle_defend, 
									down: 	spr_sniper_battle_down,
									facing: spr_sniper_battle_facing
								},
		actions: 				[global.action_library.standby, global.action_library.attack],
		status_effects:			[],
		xp_value: 				1,
		drops:					[],
		ai_script: 				function (){
			//Атакувати рандомного друга
			var _action = actions[0];
			if (ep == 2) {
				_action	= actions[1];
				ep--; //Типу лічильник кроків
			}
			var _possible_targets	= array_filter(obj_battle.party_units, function(_unit, _index){return (_unit.hp > 0);});
			var _target				= _possible_targets[irandom(array_length(_possible_targets) - 1)];
			
			return [_action, _target];
		},
		evade_script:			function (_enemy_x, _enemy_y, _enemy_x_to, _enemy_y_to, _i, _time_passed, _gun_restrict_x1, _gun_restrict_x2, _gun_restrict_y1, _gun_restrict_y2) {
			switch (_i) {
				case 0: return lerp(_enemy_x, _enemy_x_to, 0.05);
				case 1: return lerp(_enemy_y, _enemy_y_to, 0.05);
				
				case 2: if (_time_passed % 90 == 0) and (!array_contains(status_effects, global.status_effects.unconscious)) return clamp(random_range(_enemy_x - 50, _enemy_x + 50),  _gun_restrict_x1, _gun_restrict_x2);
				case 3: if (_time_passed % 90 == 0) and (!array_contains(status_effects, global.status_effects.unconscious)) return clamp(random_range(_enemy_y - 50, _enemy_y + 50), _gun_restrict_y1, _gun_restrict_y2);
			}
		}
	},
	shielder: 			{
		enemy: 					true,
		name:					"Shielder",
		hp:						5,
		hp_max:					5,
		ep:						1,
		ep_max:					2,
		ep_recorery_per_turn: 	1,
		atk:					1,
		defence:				25,
		
		base_stats: {
			hp_max:					5,
			ep_max:					2,
			ep_recorery_per_turn: 	1,
			atk:					3,
			defence:				25
		},
		base_stats_with_level: {
			hp_max:					5,
			ep_max:					2,
			ep_recorery_per_turn: 	1,
			atk:					3,
			defence:				25
		},
		
		sprites: 				{	idle: 	spr_shielder_battle_idle, 
									attack: spr_shielder_battle_attack, 
									defend: spr_shielder_battle_defend, 
									down: 	spr_shielder_battle_down,
									facing: spr_shielder_battle_facing
								},
		actions: 				[global.action_library.standby, global.action_library.defence_on_all],
		status_effects:			[],
		xp_value: 				1,
		drops:					[],
		ai_script: 				function (){
			var _action = actions[1];
			var _target = [];
			for (var i = 0; i < array_length(obj_battle.enemy_units); i++) {
				if (obj_battle.enemy_units[i].hp > 0) {
					array_push(_target, obj_battle.enemy_units[i]);
				}
			}
			
			return [_action, _target];
		},
		evade_script:			function (_enemy_x, _enemy_y, _enemy_x_to, _enemy_y_to, _i, _time_passed, _gun_restrict_x1, _gun_restrict_x2, _gun_restrict_y1, _gun_restrict_y2) {
			switch (_i) {
				case 0: return _enemy_x;
				case 1: return _enemy_y;
				
				case 2: return _enemy_x;
				case 3: return _enemy_y;
			}
		}
	},
	illusionist: 		{
		enemy: 					true,
		name:					"Illusionist",
		hp:						10,
		hp_max:					10,
		ep:						1,
		ep_max:					1,
		ep_recorery_per_turn: 	1,
		atk:					1,
		defence:				0,
		
		base_stats: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	1,
			atk:					1,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	1,
			atk:					1,
			defence:				0
		},
		
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
	psyonic: 			{
		enemy: 					true,
		name:					"Psyonic",
		hp:						5,
		hp_max:					5,
		ep:						7,
		ep_max:					10,
		ep_recorery_per_turn: 	0,
		atk:					7,
		defence:				0,
		
		
		base_stats: {
			hp_max:					5,
			ep_max:					10,
			ep_recorery_per_turn: 	0,
			atk:					7,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					5,
			ep_max:					10,
			ep_recorery_per_turn: 	0,
			atk:					7,
			defence:				0
		},
		
		sprites: 				{	idle: 	TEST_spr_ragile_thing_battle_idle, 
									attack: TEST_spr_ragile_thing_battle_attack, 
									defend: TEST_spr_ragile_thing_battle_defend, 
									down: 	TEST_spr_ragile_thing_battle_down,
									facing: TEST_spr_ragile_thing_battle_facing
								},
		actions: 				[global.action_library.standby, global.action_library.attack, global.action_library.ep_leech],
		status_effects:			[],
		xp_value: 				3,
		drops:					[],
		ai_script: 				function (){
			//Атакувати рандомного друга
			var _action = actions[2];
			if (ep == ep_max) {
				_action	= actions[1];
				ep  = 0;
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
	},
	regenerator: 		{
		enemy: 					true,
		name:					"Regenerator",
		hp:						15,
		hp_max:					15,
		ep:						1,
		ep_max:					1,
		ep_recorery_per_turn: 	1,
		atk:					1,
		defence:				0,
		
		base_stats: {
			hp_max:					15,
			ep_max:					15,
			ep_recorery_per_turn: 	1,
			atk:					1,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					15,
			ep_max:					15,
			ep_recorery_per_turn: 	1,
			atk:					1,
			defence:				0
		},
		
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
			
			//Регенерація ХП
			battle_change_hp(self, 3);
			
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
	berserk: 			{
		enemy: 					true,
		name:					"Berserk",
		hp:						15,
		hp_max:					15,
		ep:						1,
		ep_max:					1,
		ep_recorery_per_turn: 	1,
		atk:					3,
		defence:				0,
		
		base_stats: {
			hp_max:					15,
			ep_max:					15,
			ep_recorery_per_turn: 	1,
			atk:					3,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					15,
			ep_max:					15,
			ep_recorery_per_turn: 	1,
			atk:					3,
			defence:				0
		},
		
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
			
			//Оновити атаку
			atk = base_stats.atk + base_stats.atk  * 2 * (1 - hp/hp_max);
			
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
	
	//Боси. Забабахай потім нормального
	boss: 				{
		enemy: 					true,
		name:					"Boss",
		hp:						100,
		hp_max:					100,
		ep:						10,
		ep_max:					10,
		ep_recorery_per_turn: 	3,
		atk:					2,
		defence:				10,
		
		base_stats: {
			hp_max:					100,
			ep_max:					100,
			ep_recorery_per_turn: 	3,
			atk:					2,
			defence:				10
		},
		base_stats_with_level: {
			hp_max:					100,
			ep_max:					100,
			ep_recorery_per_turn: 	3,
			atk:					2,
			defence:				10
		},
		
		sprites: 				{	idle: 	TEST_spr_enemy_battle_idle, 
									attack: TEST_spr_enemy_battle_attack, 
									defend: TEST_spr_enemy_battle_defend, 
									down: 	TEST_spr_enemy_battle_down,
									facing: TEST_spr_enemy_battle_facing
								},
		actions: 				[global.action_library.standby, global.action_library.attack, global.action_library.ep_leech],
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
			
			//Оновити атаку
			atk = base_stats.atk + base_stats.atk  * 2 * (1 - hp/hp_max);
			
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
}