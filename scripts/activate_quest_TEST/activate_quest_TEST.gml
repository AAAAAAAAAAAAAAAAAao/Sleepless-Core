function activate_quest_TEST(){
	var _has_fruit = (global.ins_lifted != noone) and (global.ins_lifted.object_index == TEST_obj_quest_item);
	
	switch (global.quest_status[? "TEST_quest"]) {
		//Не початий
		case 0:	{
			if (_has_fruit) {
				new_textbox(">Oh, i take that.")
				new_textbox(">You're my friend now.");
				
				global.quest_status[? "TEST_quest"] = 2;
				global.ins_lifted 					= noone;
				
				with (TEST_obj_quest_man) sprite_index = TEST_spr_quest_man_satisfied;
				with (TEST_obj_quest_item) instance_destroy();
				with (obj_player) {
					sprite_standing = spr_mike_PJ_standing;
					sprite_walk		= spr_mike_PJ_walking;
				}
			}
			else {
				new_textbox("> I am in need of a fruit.");
				new_textbox("> Bring it to me.", 0, c_lime, 
					["5:I will.", "6:I won't."]);
			}
		} break;
		
		//В прогресі
		case 1: { 	
			if (_has_fruit) {
				new_textbox(">You're my friend now.");
				global.quest_status[? "TEST_quest"]	= 2;
				global.ins_lifted 					= noone;
				
				with (TEST_obj_quest_man) sprite_index = TEST_spr_quest_man_satisfied;
				with (TEST_obj_quest_item) instance_destroy();
				with (obj_player) {
					sprite_standing = spr_mike_PJ_standing;
					sprite_walk		= spr_mike_PJ_walking;
				}
			}
			else {
				new_textbox(">It's right here.");
				new_textbox(">Don't you see it?");
			}
		} break;
		
		//Закінчений
		case 2: {
			new_textbox(">You're my friend now.");
		} break;
	}
}