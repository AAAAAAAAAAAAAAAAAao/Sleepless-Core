//Перевірка, чи показувати UI
if (room = r_title_screen) 	visible = false;
else 						visible = true;

//Пауза меню
if (global.game_paused) {
	key_up      = keyboard_check_pressed(vk_up)    or keyboard_check_pressed(ord("W"));
	key_down    = keyboard_check_pressed(vk_down)  or keyboard_check_pressed(ord("S"));
	
	key_confirm = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
	key_cancel  = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);
	key_menu    = keyboard_check_pressed(ord("C")) or keyboard_check_pressed(vk_control);
	
	pause_option_selected += (key_down - key_up);
	
	if (pause_option_selected >= array_length(pause_option)) 	pause_option_selected = 0;
	if (pause_option_selected < 0) 								pause_option_selected = array_length(pause_option) - 1;
		
	if (key_confirm) {
		switch (pause_option_selected) {
			case 0: { //Продовжити
				global.game_paused = false;
				
				with (all) {
					game_paused_image_speed = image_speed;
					image_speed = 0;
				}
				
				break;
			}
			case 1: { //Зберегти та вийти
				with (obj_game) instance_destroy();
				save_game();
				game_restart();
				
				break;
			}
			case 2: { // Зберегти та вийти з гри
				save_game();
				game_end();
				break;
			}
		}
	}
}