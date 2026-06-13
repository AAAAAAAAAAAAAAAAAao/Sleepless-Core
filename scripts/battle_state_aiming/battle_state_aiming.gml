///@description Стан бою. Створює вікно для прицілювання на ворога, використовуючи global.aim_target та global.aim_user.
function battle_state_aiming(){
	//Якщо вікна не існує
	if (aim_window_id == noone) {
		//створити нове вікно
		aim_window_id = instance_create_depth(
			x,
			y,
			depth - 10,
			obj_aim_window
		);
	}
	//Коли воно зникло
	if (!instance_exists(aim_window_id)) {
		aim_window_id = noone;
		
		global.aim_user.sprite_index = global.aim_user.sprites.idle;
		//Продовжити гру
		battle_state = battle_state_perform_action;
	}
}
