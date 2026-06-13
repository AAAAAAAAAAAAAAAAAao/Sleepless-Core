global.items = {
	TEST_item_hp: {
		name: 						"TEST_item_hp",
		description: 				"{0} healed",
		sub_menu: 					"Items",
		target_required: 			false,
		target_enemy_by_default:	false,
		target_all: 				MODE.NEVER,
		user_animation: 			"",
		effect_sprite: 				noone,
		effect_on_target: 			MODE.ALWAYS,
		count:						1,
		func: function(_user) {
			battle_change_hp(_user, 5);
		} 
	},
	TEST_item_ep: {
		name: 						"TEST_item_ep",
		description: 				"{0} restored ep",
		sub_menu: 					"Items",
		target_required: 			false,
		target_enemy_by_default:	false,
		target_all: 				MODE.NEVER,
		user_animation: 			"",
		effect_sprite: 				noone,
		effect_on_target: 			MODE.ALWAYS,
		count:						1,
		func: function(_user) {
			battle_change_ep(_user, 5);
		} 
	},
	TEST_item_dmg: {
		name: 						"TEST_item_dmg",
		description: 				"{0} damaged {1}",
		sub_menu: 					"Items",
		target_required: 			true,
		target_enemy_by_default:	true,
		target_all: 				MODE.NEVER,
		user_animation: 			"",
		effect_sprite: 				noone,
		effect_on_target: 			MODE.ALWAYS,
		count:						1,
		func: function(_user, _target) {
			if (array_length(_target) > 1) {
				for (var i = 0; i < array_length(_target) - 1; i++) {
					battle_change_hp(_target[i], -5);
				}
			}
			battle_change_hp(_target[0], -5);
		} 
	}
}