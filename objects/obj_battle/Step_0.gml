battle_state();

if (cursor.active) {
	with (cursor) {
		//Керування
		var _key_up 		= keyboard_check_pressed(vk_up)     or keyboard_check_pressed(ord("W"));
		var _key_down 		= keyboard_check_pressed(vk_down)   or keyboard_check_pressed(ord("S"));
		var _key_left 		= keyboard_check_pressed(vk_left)   or keyboard_check_pressed(ord("A"));
		var _key_right 		= keyboard_check_pressed(vk_right)	or keyboard_check_pressed(ord("D"));
		var _key_toggle 	= false;
		var _key_confirm	= false;
		var _key_cancel 	= false;
		confirm_delay++;
		if (confirm_delay > 1) {
			_key_confirm	= keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
			_key_cancel 	= keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);
			_key_toggle 	= keyboard_check_pressed(ord("C")) or keyboard_check_pressed(vk_control);
		}
		var _move_hor = _key_right - _key_left;
		var _move_ver = _key_down - _key_up;
		
		if (_move_hor == -1)	target_side = obj_battle.party_units;
		if (_move_hor == 1) 	target_side = obj_battle.enemy_units;
			
		//Лежачих не бити
		if (target_side == obj_battle.enemy_units) {
			target_side = array_filter(target_side, function(_element, _index){
				return _element.hp > 0;
			});
		}
		//Перемикання між цілями
		if (target_all == false) {
			if (_move_ver == 1) target_index--;
			if (_move_ver == -1) target_index++;
			
			var _targets = array_length(target_side);
			if (target_index < 0) target_index = _targets - 1;
			if (target_index > (_targets - 1)) target_index = 0;
			
			
			active_target = target_side[target_index];
			
			if (active_action.target_all == MODE.VARIES) && (_key_toggle) {
				target_all = true;
			}
		}
		else {
			active_target = target_side;
			if (active_action.target_all == MODE.VARIES) && (_key_toggle) {
				target_all = false;
			}
		}
		
		//Підтвердження дії
		if (_key_confirm) {
			with (obj_battle) begin_action(cursor.active_user, cursor.active_action, cursor.active_target);
			with (obj_menu) instance_destroy();
			active = false;
			confirm_delay = 0;
		}
		//Скасування дії
		if (_key_cancel) && (!_key_confirm) {
			with (obj_menu) active = true;
			active = false;
			confirm_delay = 0;
		}
	}
}
//Зміна змінних для анімаці

// \/ Початкова анімація \/
bg_alpha = lerp(bg_alpha, 100, 0.1);
if (bg_alpha >= 30) {
	bottom_ui_y = lerp(bottom_ui_y, y + 200, 0.2);
	
	if (bottom_ui_y <= y + 250) {
		bottom_ui_text_alpha = lerp(bottom_ui_text_alpha, 100, 0.1);
	}
}
// /\ Початкова анімація/\

// \/ Ефект друкраської машинки логу \/
var _last_text = global.battle_log[array_length(global.battle_log) - 1];

if (log_last_chars < string_length(_last_text)) {
	log_last_chars += 1; // 1 - швидкість друку
}
if (array_length(global.battle_log) > battle_log_length) {
	battle_log_length = array_length(global.battle_log);
	log_last_chars = 0;
} 
// /\ Ефект друкраської машинки логу /\

// \/ Кінцева анімація \/
if (global.battle_won) {
	//Одноразово вивести повідомлення про перемогу
	if (!victiry_message_added) {
		//Додавання xp ворогів
		new_textbox(string_ext("You have won and earned {0} XP.", [xp_pending]));
		global.xp += xp_pending;
		victiry_message_added = true;
	}
	
	//Закрити текстбокс
	if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter)) victory_confirmed = true;
	
	if (victory_confirmed) {
		//Fade out для тих, хто має альфу
		all_fade_out = lerp(all_fade_out, 100, 0.1);
		//Іншим по змінним
		bottom_ui_y	= lerp(bottom_ui_y, y + 500, 0.1);
		
		if (all_fade_out >= 30) {
			instance_activate_all();
			instance_destroy(creator);
			instance_destroy();
		}
	}
}
// /\ Кінцева анімація/\

//Для статус-ефектів
for (var i = 0; i < array_length(units); i++) {
	var _status_effects_count = array_length(units[i].status_effects)
	
	if (_status_effects_count > 0) {
		for (var j = 0; j < _status_effects_count; j++) {
			if (array_length(icon_alpha) < _status_effects_count) {
				icon_alpha[j] = 0;
			}
			
			//Чи з'являється, чи зникає
			var _current_effect = units[i].status_effects[j];
			if (_current_effect.turns_passed < _current_effect.duration) {
				icon_alpha[j] = lerp(icon_alpha[j], 100, 0.1);
			}
			else {
				icon_alpha[j] = lerp(icon_alpha[j], 0, 0.1);
			}
		}
	}
}