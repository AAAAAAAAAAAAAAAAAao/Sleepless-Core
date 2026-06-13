draw_sprite_ext(battle_background, 0, x, y, image_xscale, image_yscale, 0, c_white, (bg_alpha - all_fade_out) / 100);
if (bg_alpha >= 30) {
	var _unit_with_current_turn = units[turn].id;
	for (var i = 0; i < array_length(unit_render_order); i++){
		with (unit_render_order[i]) {
			draw_self();
		}
	}
	
	draw_sprite_stretched(spr_textBox_bg, 0, x+0, bottom_ui_y, 99, 100);
	draw_sprite_stretched(spr_textBox_bg, 0, x+100, bottom_ui_y, 300, 100);
	
	
	
	//Додати текст з анімацією, коли виглядає доречно
	if (bottom_ui_y <= y + 230) {
		draw_set_font(fnt_text);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_colour(c_lime);
		draw_set_alpha((bottom_ui_text_alpha - all_fade_out) / 100.0);
		draw_text(x + COLUMN_ENEMY, 	y + 215, "ENEMIES");
		draw_text(x + COLUMN_NAME, 		y + 215, "NAME");
		draw_text(x + COLUMN_HEALTH, 	y + 215, "HP");
		draw_text(x + COLUMN_ENERGY, 	y + 215, "EP");
			
			
		//Малювання імен ворогів
		var _draw_limit = 8;
		var _drawn = 0;
		for (var i = 0; (i< array_length(enemy_units)) && (_drawn < _draw_limit); i++){
			var _char = enemy_units[i];
			if (_char.hp > 0) {
				_drawn++;
				draw_set_colour(c_white);
				if (_char.id == _unit_with_current_turn) draw_set_color (c_yellow);
					
				draw_text(x + COLUMN_ENEMY, y + 236 + ((_drawn - 1)*16), _char.name);
			}
		}
		//Малювання імен друзів
		for (var i = 0; i< array_length(party_units); i++){
			draw_set_halign(fa_left);
			draw_set_colour(c_white);
			var _char = party_units[i];
			if (_char.id == _unit_with_current_turn) draw_set_colour(c_yellow);
				
			if (_char.hp <= 0) draw_set_colour(c_gray);
				
			draw_text(x + COLUMN_NAME, y + 236 + (i*16), _char.name);
			
			draw_set_colour(c_white);
			draw_text(x + COLUMN_HEALTH, y + 236 + (i*16), string(_char.hp) + "/" + string(_char.hp_max));
			
			draw_set_colour(c_white);
			draw_text(x + COLUMN_ENERGY, y + 236 + (i*16), string(_char.ep) + "/" + string(_char.ep_max));
			
			draw_set_colour(c_white);
		}
	}
	draw_set_alpha(1.0);
	
	
	
	if (cursor.active) {
		with (cursor) {
			if (active_target != noone){
				if (!is_array(active_target)) {
					draw_sprite(spr_cross, 0, active_target.x, active_target.y);
				}
				else {
					draw_set_alpha(sin(get_timer()/50000) + 1);
					for (var i = 0; i < array_length(active_target); i++) {
						draw_sprite(spr_cross, 0, active_target[i].x, active_target[i].y);
					}
					draw_set_alpha(1.0);
				}
			}
		}
	}
	
	//Батл-лог
	for (var i = 0; i < array_length(global.battle_log); i++) {
		var _log_index = array_length(global.battle_log) - 1 - i;
		var _log_text = global.battle_log[_log_index];
		
		draw_set_font(fnt_little_text);
		draw_set_colour(c_black);
		draw_set_halign(fa_left);
		draw_set_alpha((100 - i * 10 - all_fade_out) / 100.0)
		
		if (i == 0) {
			var _last_log = string_copy(_log_text, 1, floor(log_last_chars));
			draw_text(x + 10, y + 10 + i * 8, _last_log);
		}
		else {
			draw_text(x + 10, y + 10 + i * 8, _log_text);
		}
		draw_set_colour(c_white);
		draw_set_alpha(1.0);
		draw_set_font(fnt_text);
	}
	
	//Статус-ефекти
	for (var i = 0; i < array_length(units); i++) {
		
		//Якщо живий
		if (units[i].hp > 0) {
			var _status_effects_count = array_length(units[i].status_effects)
			
			if (_status_effects_count > 0) {
				for (var j = 0; j < _status_effects_count; j++) {
					var _status_effect = units[i].status_effects[j];
					var turns_passed = _status_effect.turns_passed;
					draw_sprite_ext(_status_effect.sprite, turns_passed, units[i].x - 20, units[i].y - 8 - j * 8, image_xscale, image_yscale, 0, c_white, _status_effect.draw_alpha / 100);
				}
			}
		}
	}
}