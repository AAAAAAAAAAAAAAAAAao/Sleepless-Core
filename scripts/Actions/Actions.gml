global.action_library = {
	attack: {
		name: 						"Attack",
		description: 				"{0} attacked {1}",
		sub_menu: 					-1,
		ep_cost: 					1,
		target_required: 			true,
		target_enemy_by_default:	true,
		target_all: 				MODE.NEVER,
		user_animation: 			"attack",
		effect_sprite: 				spr_attack_bonk,
		effect_on_target: 			MODE.ALWAYS,
		
		func: function(_user, _targets) {
			//Якщо бот - все просто
			if (_user.enemy) {
				var _damage = ceil(_user.atk + random_range(-_user.atk * 0.25, _user.atk * 0.25));
				if (is_array(_targets))	battle_change_hp(_targets[0], -_damage, 0);
				else					battle_change_hp(_targets, -_damage, 0);
				
				battle_change_ep(_user, -ep_cost);
			}
			//А свої нехай паряться. Цей фрагмент коду втілений в begin_action
		} 
	},
	standby: {
		name: 						"Standby",
		description: 				"{0} did nothing",
		sub_menu: 					-1,
		ep_cost: 					0,
		target_required: 			false,
		target_enemy_by_default:	false,
		target_all: 				MODE.NEVER,
		user_animation: 			"", 
		effect_sprite: 				noone,
		effect_on_target: 			MODE.NEVER,
		
		func: function(_user) {
			//Ти пропустив хід, тому зберіг відновлені EP за цей хід
		} 
	},
	//ENERGY субменю
	full_auto: {
		name: 						"Full-auto",
		description: 				"{0} fired at {1}",
		sub_menu: 					"Energy",
		ep_cost: 					5,
		target_required: 			true,
		target_enemy_by_default:	true,
		target_all: 				MODE.NEVER,
		user_animation: 			"shoot",
		effect_sprite: 				spr_attack_bonk,
		effect_on_target: 			MODE.ALWAYS,
		
		func: function(_user, _targets) {
			var _damage_dealt = 0;
			for (var i = 0; i < 30; i++) {
				var _dice = irandom(100);
				
				if (_dice <= 75) {
					_damage_dealt += _user.atk * 0.1;
				}
			}
			battle_change_ep(_user, -ep_cost);
			battle_change_hp(_targets, -_damage_dealt);
		} 
	},
	scrach_the_butt: {
		name: 						"Scratch The Butt",
		description: 				"{0} scrached butt",
		sub_menu: 					"Energy",
		ep_cost: 					0,
		target_required: 			false,
		target_enemy_by_default:	false,
		target_all: 				MODE.NEVER,
		user_animation: 			-1,
		effect_sprite: 				-1,
		effect_on_target: 			-1,
		
		func: function(_user, _targets) {
			battle_change_hp(_user, _user.hp_max * 0.1);
		} 
	},
	dinner: {
		name: 						"Dinner",
		description: 				"{0} had a wonderful dish",
		sub_menu: 					"Energy",
		ep_cost: 					6,
		target_required: 			false,
		target_enemy_by_default:	false,
		target_all: 				MODE.NEVER,
		user_animation: 			-1,
		effect_sprite: 				-1,
		effect_on_target: 			-1,
		
		func: function(_user, _targets) {
			battle_change_hp(_user, _user.hp_max * 0.4);
			battle_change_ep(_user, -ep_cost);
		} 
	},
	//Лише для ворогів
	defence_on_all:{
		name: 						"Defence on all",
		description: 				"{0} defends everyone",
		sub_menu: 					-1,
		ep_cost: 					0,
		target_required: 			false,
		target_enemy_by_default:	false,
		target_all: 				MODE.NEVER,
		user_animation: 			-1,
		effect_sprite: 				-1,
		effect_on_target: 			-1,
		
		func: function(_user, _targets) {
			var _alive = array_filter(obj_battle.enemy_units, function(_unit) {
				return instance_exists(_unit) and _unit.hp > 0;
			});
			
			battle_add_status(_alive, global.status_effects.defence_buff25);
		} 
	},
	ep_leech:{
		name: 						"Ep leech",
		description: 				"{0} steals EP",
		sub_menu: 					-1,
		ep_cost: 					0,
		target_required: 			true,
		target_enemy_by_default:	true,
		target_all: 				MODE.NEVER,
		user_animation: 			-1,
		effect_sprite: 				-1,
		effect_on_target: 			-1,
		
		func: function(_user, _targets) {
			var _val = 3;
			
			if (_targets.ep > _val) battle_change_ep(_user, _val);
			else 					battle_change_ep(_user, _targets.ep);
			
			battle_change_ep(_targets, -_val);
		} 
	}
}