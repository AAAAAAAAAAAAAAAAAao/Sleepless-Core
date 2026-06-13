global.status_effects = {
	TEST_example:{
		name: "TEST example effect",
		description: "{0} effected",
		description_gone: "{0} regained consciousness",
		duration: 99,
		turns_passed: 0,
		sprite: noone,
		func: function(_user){
			array_push(global.battle_log, "Effect is present")
		}
	},
	unconscious: {
		name: "Unconscious",
		description: "{0} is unconscious",
		description_gone: "{0} regained consciousness",
		duration: 3,
		turns_passed: 0,
		sprite: spr_icon_unconcious,
		func: function(_user){
			_user.sprite_index = _user.sprites.down;
			_user.image_index = 0;
		}
	},
	pain_shock: {
		name: "Pain Shock",
		description: "{0} is in pain shock",
		description_gone: "{0} recovers from pain shock",
		duration: 3, 
		turns_passed: 0,
		sprite: spr_icon_pain_shock,
		func: function(_user){
			chance = 50;
			var _dice = irandom_range(1,100);
			if (_dice <= chance) {
				battle_remove_status(_user, global.status_effects.pain_shock, true);
				battle_add_status(_user, global.status_effects.unconscious);
			}
		}
	}
}