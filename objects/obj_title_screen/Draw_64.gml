//Задній фон
if (show_template) {
	draw_sprite(spr_menu_template, 0, 0, 0);
	
	//Основні дані
	if (show_data) {
		//Назва гри
		draw_set_colour(#F9FFFF);
		draw_set_font(fnt_text);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_text(200, -3, "Sleepless Core");
		
		//Копірайт
		draw_set_colour(#050098);
		draw_text(200, 284, "v0.0.0 (C)Copyright 2026 2026. NoOneGuy.");
		
		//Меню
		draw_set_halign(fa_left);
		
		for (var i = 0; i < menu_options_size; i++) {
			
			var _x = 0;
			for (var j = 0; j < i; j++) {
				_x += menu_options_string_lengths[j];
			}
			
			//Чи обраний
			if (menu_selected = i) 	{
				//Виділити
				draw_set_colour(#050098);
				draw_rectangle(i * 10 + _x + 10, 14, i * 10 + _x + menu_options_string_lengths[i] + 5, 26, false);
				draw_set_colour(#F9FFFF);
			}
			else draw_set_colour(#050098);
				
			draw_text(i * 10 + _x + 10, 11, global.menu_options[i].name);
		}
		
		//Справа знизу підказка
		draw_set_valign(fa_bottom);
		draw_set_colour(#A7A5A9);
		draw_set_font(fnt_little_text);
		draw_text(282, 273, "[ARWS] or [W/S] Select Item\n[ARWS] or [A/D] Select Menu\n[Z] or [ENTER] Activate Item\n[X] or [SHIFT] Go Back \n[C] or [CTRL] Alternative Action");
		
		//Тайтл
		draw_set_font(fnt_text);
		draw_text(11, 53, global.menu_options[menu_selected].title);
		
		//Субменю
		draw_set_valign(fa_top);
		
		var _current_menu 	= global.menu_options[menu_selected];
		var _submenu_count 	= array_length(_current_menu.submenu);
		var _row			= -2;
		
		for (var i = 0; i < _submenu_count; i++) {
			//Якщо назва субсубменю
			if (!_current_menu.submenu[i].usable)	_row += 2;
			else 									_row += 1;
				
			if (submenu1_selected == i) draw_set_colour(#F9FFFF);
			draw_text(11, 60 + _row * 16, _current_menu.submenu[i].name);
			draw_set_colour(#A7A5A9);
		}
		
		//Короткий опис
		var _current_submenu = _current_menu.submenu[submenu1_selected];
		if (_current_submenu.usable) {
			draw_set_colour(#A7A5A9);
			draw_set_valign(fa_top);
			draw_text(282, 35, _current_submenu.description);
		}
		draw_set_colour(c_white);
		
		//Субменю2
		if (global.is_submenu_selected and global.menu_options[menu_selected].submenu[submenu1_selected].script_draw != -1) global.menu_options[menu_selected].submenu[submenu1_selected].script_draw();
	}
}