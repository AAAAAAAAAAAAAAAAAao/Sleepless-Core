//Змінні для анімації
startup_timer 	= 0; //До 60. Ключові на 55 та 60
show_template 	= false;
show_data 		= false;


//Меню
menu_options_size 			= array_length(global.menu_options);
menu_options_string_lengths = [];
confirm_delay 				= 0;

for (var i = 0; i < menu_options_size; i++) menu_options_string_lengths[i] = string_width(global.menu_options[i].name);

menu_selected 				= 0;
submenu1_selected 			= 1;

global.is_submenu_selected = false;

global.frame_colour = c_black;

global.game_save_slot = -1;

global.submenu2_selected = 0;

load_settings();