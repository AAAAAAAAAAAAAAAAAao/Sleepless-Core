global.status_effects = {
	TEST_example:	{
		name: "TEST example effect",
		description: "{0} effected",
		description_gone: "{0} regained consciousness",
		duration: 99,
		turns_passed: 0, draw_alpha: 0,
		sprite: noone,
		func: function(_user){
			array_push(global.battle_log, "Effect is present")
		},
		func_gone: function(_user){
			//Нічого не робити
		}
	},
	unconscious: 	{
		name: "Unconscious",
		description: "{0} is unconscious",
		description_gone: "{0} regained consciousness",
		duration: 3,
		turns_passed: 0, draw_alpha: 0,
		sprite: spr_icon_unconcious,
		func: function(_user){
			_user.sprite_index = _user.sprites.down;
			_user.image_index = 0;
		},
		func_gone: function(_user){
			//Нічого не робити
		}
	},
	pain_shock: 	{
		name: "Pain Shock",
		description: "{0} is in pain shock",
		description_gone: "{0} recovers from pain shock",
		duration: 3, 
		turns_passed: 0, draw_alpha: 0,
		sprite: spr_icon_pain_shock,
		func: function(_user){
			var _chance = 50;
			var _dice = irandom_range(1,100);
			if (_dice <= _chance) {
				battle_remove_status(_user, global.status_effects.pain_shock, true);
				battle_add_status(_user, global.status_effects.unconscious);
			}
		},
		func_gone: function(_user){
			//Нічого не робити
		}
	},
	ATK_buff25:		{
		name: "Attack buff",
		description: "{0} ganied Attack buff",
		description_gone: "{0} lost Attack buff",
		duration: 3,
		turns_passed: 0, draw_alpha: 0,
		sprite: spr_icon_atk_buff25,
		func: function(_user){
			_user.atk = floor(_user.base_stats_with_level.atk + _user.base_stats_with_level.atk * 0.25);
		},
		func_gone: function(_user){
			_user.atk = _user.base_stats_with_level.atk;
		}
	},
	ATK_buff50:		{
		name: "Strong atack buff",
		description: "{0} ganied Strong atack buff",
		description_gone: "{0} lost Strong atack buff",
		duration: 3,
		turns_passed: 0, draw_alpha: 0,
		sprite: spr_icon_atk_buff50,
		func: function(_user){
			_user.atk = floor(_user.base_stats_with_level.atk + _user.base_stats_with_level.atk * 0.50);
		},
		func_gone: function(_user){
			_user.atk = _user.base_stats_with_level.atk;
		}
	},
	defence_buff25:	{
		name: "Weak defence buff",
		description: "{0} gained Weak defence buff",
		description_gone: "{0} lost Weak defence buff",
		duration: 1,
		turns_passed: 0, draw_alpha: 0,
		sprite: spr_icon_defence25,
		func: function(_user){
			_user.defence = _user.base_stats.defence + 25;
			
		},
		func_gone: function(_user){
			_user.defence = _user.base_stats.defence;
		}
	},
}