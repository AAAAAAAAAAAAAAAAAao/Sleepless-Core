//Керування
key_left    = keyboard_check_pressed(vk_left)  or keyboard_check_pressed(ord("A"));
key_right   = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
key_up      = keyboard_check_pressed(vk_up)    or keyboard_check_pressed(ord("W"));
key_down    = keyboard_check_pressed(vk_down)  or keyboard_check_pressed(ord("S"));

key_confirm = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
key_cancel  = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);
key_menu    = keyboard_check_pressed(ord("C")) or keyboard_check_pressed(vk_control);

//Для анімації
if (global.settings.startup_timer) {
	if (startup_timer < 60) {
		startup_timer++;
		
		if (startup_timer > 55) show_template = true;
	}
}
else show_template = true;

if (global.settings.blink and !show_data)show_data = true;
else show_data = true;




//Для керування
var _vertical_control 	= key_up 	- key_down;
var _horisontal_control = key_left 	- key_right;

//Навігація по меню
if (_horisontal_control != 0 and !global.is_submenu_selected) {
	if (_horisontal_control > 0) {
		menu_selected--;
		if (menu_selected < 0) menu_selected = menu_options_size - 1;
		
		submenu1_selected = 1;
		
		if (global.settings.blink) show_data = false;
		
	}
	if (_horisontal_control < 0) {
		menu_selected++;
		if (menu_selected >= menu_options_size) menu_selected = 0; 
		
		submenu1_selected = 1;
		
		if (global.settings.blink) show_data = false;
	}
}

//Навігація по субменю1
if (_vertical_control != 0 and !global.is_submenu_selected) {
	if (_vertical_control > 0) {
		submenu1_selected--;
		if (submenu1_selected < 1) submenu1_selected = array_length(global.menu_options[menu_selected].submenu) - 1;
		if (!global.menu_options[menu_selected].submenu[submenu1_selected].usable) submenu1_selected--;
		if (submenu1_selected < 1) submenu1_selected = array_length(global.menu_options[menu_selected].submenu) - 1;
		
		if (global.settings.blink) show_data = false;
	}
	if (_vertical_control < 0) {
		submenu1_selected++;
		if (submenu1_selected >= array_length(global.menu_options[menu_selected].submenu)) submenu1_selected = 1;
		if (!global.menu_options[menu_selected].submenu[submenu1_selected].usable) submenu1_selected++;
		if (submenu1_selected >= array_length(global.menu_options[menu_selected].submenu)) submenu1_selected = 1;
		
		if (global.settings.blink) show_data = false;
	}
}

//Навігація по субменю2
var _current_submenu = global.menu_options[menu_selected].submenu[submenu1_selected];
if (key_confirm and _current_submenu.usable and !global.is_submenu_selected) global.is_submenu_selected = true;

if (global.is_submenu_selected) {
	//Власне навігація
	if (_vertical_control != 0) {
		
		if (_vertical_control < 0) {
			if (global.submenu2_selected + 1 > 2) 	global.submenu2_selected = 0;
			else									global.submenu2_selected++;
		}
		if (_vertical_control > 0) {
			if (global.submenu2_selected - 1 < 0) 	global.submenu2_selected = 2;
			else									global.submenu2_selected--;
		}
	}
	
	// \/ Виключення \/
	if (key_confirm and ((menu_selected == 0 and submenu1_selected == 1) or (menu_selected == 1 and submenu1_selected == 3) or (menu_selected == 2) or (menu_selected == 3))) {
		_current_submenu.script_step();
	}
	// /\ Виключення /\
	
	else {
		confirm_delay++
		if (key_confirm and confirm_delay > 1) _current_submenu.script_step();
	}
}
else {
	confirm_delay = 0;
	global.submenu2_selected = 0;
}

//Відміна субменю
if (key_cancel and global.is_submenu_selected) global.is_submenu_selected = false;

//Для меню2
global.menu_options[1].submenu[4].name = "SAVE DATA" + string_ext("\nCurrent save: {0}", [global.game_save_slot]);

//Для меню3
//VIDEO
if (global.settings.fullscreen = true) 		global.menu_options[2].submenu[1].name = "Fullscreen:           [Enabled]";
else										global.menu_options[2].submenu[1].name = "Fullscreen:           [Disabled]";

if (global.settings.startup_timer = true) 	global.menu_options[2].submenu[2].name = "Startup delay:        [Enabled]";
else										global.menu_options[2].submenu[2].name = "Startup delay:        [Disabled]";

if (global.settings.blink = true) 			global.menu_options[2].submenu[3].name = "Blink on menu change: [Enabled]";
else										global.menu_options[2].submenu[3].name = "Blink on menu change: [Disabled]";