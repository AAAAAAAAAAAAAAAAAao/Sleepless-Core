function use_item_bomb(){
	if (global.player_ammo[TEST_ITEM.BOMB] > 0) and (global.ins_lifted == noone) {
		global.player_ammo[TEST_ITEM.BOMB]--;
		var _bomb = instance_create_layer(x, y, "Instances", TEST_obj_bomb);
		activate_liftable(_bomb);
	}
}