function activate_liftable(_id){
	if (global.ins_lifted == noone){
		player_act_out_animation(spr_mike_PJ_lifting);
		
		sprite_standing	= spr_mike_PJ_lifting;
		sprite_walk 	= spr_mike_PJ_lifting_walking;
		
		global.ins_lifted = _id;
		with (global.ins_lifted){
			lifted		= true;
			persistent	= true;
		}
	}
}