//управління 
key_left    = keyboard_check(vk_left)          or keyboard_check(ord("A"));
key_right   = keyboard_check(vk_right)         or keyboard_check(ord("D"));
key_up      = keyboard_check(vk_up)            or keyboard_check(ord("W"));
key_down    = keyboard_check(vk_down)          or keyboard_check(ord("S"));

key_confirm = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
key_cancel  = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);
key_menu    = keyboard_check_pressed(ord("C")) or keyboard_check_pressed(vk_control);

key_run     = keyboard_check(vk_shift); // Як key_cancel, тільки з триманям кнопки
key_bomb	= keyboard_check_pressed(ord("X")) // Як key_cancel, але лише X



//контроль переміщення
input_direction = point_direction(0, 0, key_right-key_left, key_down-key_up);
input_magnitude = (key_right-key_left!=0) or (key_down-key_up!=0);

if (!global.game_paused){
    script_execute(state);
}
depth = -bbox_bottom;