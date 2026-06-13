global.scope = {
	iron_sight: {
		front: spr_scope_iron_sight_front,
		back: spr_scope_iron_sight_back
	}
}

global.party = [
	{
		enemy: 					false,
		name:					"You",
		hp:						10,
		hp_max:					10,
		ep:						10,
		ep_max:					10,
		ep_recorery_per_turn: 	3,
		atk:					2,
		defence:				0,
		
		base_stats: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	3,
			atk:					2,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	3,
			atk:					2,
			defence:				0
		},
		//Для прицілювання
		scope_type:				global.scope.iron_sight,
		gun_front_speed: 		0.1, 	//Чутливість
		gun_back_follow: 		0.1, 	//Інерція
		gun_friction: 			0.97,   //Ковзання
		
		sprites: 				{	idle: 	spr_battle_main_guy_idle,
									aim:	spr_battle_main_guy_aim,
									shoot: 	spr_battle_main_guy_shoot, 
									defend: TEST_spr_mike_PJ_standing_battle_defend, 
									down: 	spr_battle_main_guy_down,
									facing: spr_battle_main_guy_facing
								},
		actions: 				[	global.action_library.attack, 
									global.action_library.standby
								],
		status_effects:			[],
	},
	{
		enemy: 					false,
		name:					"Maria",
		hp:						10,
		hp_max:					10,
		ep:						10,
		ep_max:					10,
		ep_recorery_per_turn: 	3,
		atk:					5,
		defence:				0,
		
		base_stats: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	3,
			atk:					5,
			defence:				0
		},
		base_stats_with_level: {
			hp_max:					10,
			ep_max:					10,
			ep_recorery_per_turn: 	3,
			atk:					5,
			defence:				0
		},
		//Для прицілювання
		scope_type:				global.scope.iron_sight,
		gun_front_speed: 		0.1, 	//Чутливість
		gun_back_follow: 		0.1, 	//Інерція
		gun_friction: 			0.97,   //Ковзання
		
		sprites: 				{	idle: 	spr_battle_main_guy_idle,
									aim:	spr_battle_main_guy_aim,
									shoot: 	spr_battle_main_guy_shoot, 
									defend: TEST_spr_mike_PJ_standing_battle_defend, 
									down: 	spr_battle_main_guy_down,
									facing: spr_battle_main_guy_facing
								},
		actions: 				[	global.action_library.attack, 
									global.action_library.standby,
									global.action_library.full_auto,
									global.action_library.scrach_the_butt,
									global.action_library.dinner
								],
		status_effects:			[],
	}
]; 
