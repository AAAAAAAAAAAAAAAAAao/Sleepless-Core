global.scope = {
	iron_sight: {
		front: spr_scope_iron_sight_front,
		back: spr_scope_iron_sight_back
	}
}

global.party = [
	{
		enemy: 					false,
		name:					"Mike",
		hp:						10,
		hp_max:					10,
		ep:						10,
		ep_max:					10,
		ep_recorery_per_turn: 	1,
		atk:					2,
		//Для прицілювання
		scope_type:				global.scope.iron_sight,
		gun_front_speed: 		0.1, 	//Чутливість
		gun_back_follow: 		0.1, 	//Інерція
		gun_friction: 			0.97,   //Ковзання
		
		sprites: 				{	idle: 	TEST_spr_mike_PJ_standing_battle_idle, 
									attack: TEST_spr_mike_PJ_standing_battle_attack, 
									defend: TEST_spr_mike_PJ_standing_battle_defend, 
									down: 	TEST_spr_mike_PJ_standing_battle_down,
									facing: TEST_spr_mike_PJ_standing_battle_facing
								}, //Заповнинити нормальними спрайтами
		actions: 				[	global.action_library.attack, 
									global.action_library.standby
								],
		status_effects:			[],
	},  
	{
		enemy: 					false,
		name:					"test_friend",
		hp:						10,
		hp_max:					10,
		ep:						10,
		ep_max:					10,
		ep_recorery_per_turn: 	1,
		atk:					2,
		//Для прицілювання
		scope_type:				global.scope.iron_sight,
		gun_front_speed: 		0.1, 	//Чутливість
		gun_back_follow: 		0.1, 	//Інерція
		gun_friction: 			0.97,   //Ковзання
		
		sprites: 				{	idle: 	TEST_spr_friend_battle_idle, 
									attack: TEST_spr_friend_battle_attack, 
									defend: TEST_spr_friend_battle_defend, 
									down: 	TEST_spr_friend_battle_down,
									facing: TEST_spr_friend_battle_facing
								},
		actions: 				[	global.action_library.attack, 
									global.action_library.standby, 
									global.action_library.dinner
								],
		status_effects:			[],
	}
]; 
