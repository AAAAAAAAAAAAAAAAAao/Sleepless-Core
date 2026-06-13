//Анімація
lerp_progress += (1 - lerp_progress) / 50;
heigth_lerp = lerp(heigth_lerp, height_full, lerp_progress);


if (active) {
	//контроль
	hover -= (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))) - (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")));
	
	if (hover > array_length(options)-1) 	hover = 0;
	if (hover < 0) 							hover = array_length(options) - 1;
		
	if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter)) {
		if (array_length(options[hover]) > 1) && (options[hover][3] == true) {
			if (options[hover][1] != -1) {
				var _func = options[hover][1];
				if (options[hover][2] != -1) script_execute_ext(_func, options[hover][2]); else _func();
			}
		}
	}
	if (keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift)) {
		if (sub_menu_level > 0) menu_go_back();
	}
}