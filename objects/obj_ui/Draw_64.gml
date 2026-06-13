var _xx, _yy;
_xx = 10;
_yy = 0;

//XP, тест. Певне не потрібно. Я хз, яка йому тут потреба
draw_sprite(TEST_spr_UI_XP, 0, _xx, _yy);

draw_set_colour(c_black);
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

_xx += sprite_get_width(TEST_spr_UI_XP) + 4;
_yy += 16;
var _str = string_ext("XP: {0}", [global.xp]);
draw_text(_xx + 1, _yy, _str);
draw_text(_xx - 1, _yy, _str);
draw_text(_xx, _yy + 1, _str);
draw_text(_xx, _yy - 1, _str);
draw_set_colour(c_white);
draw_text(_xx, _yy, _str);

//Екіперований предмет
_yy += 16;
_xx = 10;
draw_sprite(TEST_spr_equiped_box, 0, _xx, _yy);

if (global.player_has_any_items) {
	draw_sprite(TEST_spr_equiped_item, global.player_equiped, _xx, _yy);
	if (global.player_ammo[global.player_equiped] != -1) {
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_set_colour(c_gray);
		draw_text(_xx + sprite_get_width(TEST_spr_equiped_box) + 2, _yy + sprite_get_height(TEST_spr_equiped_box) + 2, string(global.player_ammo[global.player_equiped]));
	}
}

//Пауза меню
if (global.game_paused) {
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);
	draw_set_alpha(1.0);
	draw_set_colour(c_white);
	draw_set_font(fnt_text); 
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	draw_text(15, RESOLUTION_H * 0.5, "Game paused");
	for (var i = 0; i < array_length(pause_option); i++) {
		var _print = "";
		
		if (i == pause_option_selected) {
			
			draw_set_colour(c_yellow);
			_print += "> " + pause_option[i];
			draw_set_colour(c_white);
			
		}
		else {
			_print += "  " + pause_option[i];
		}
		
		draw_text(10, RESOLUTION_H * 0.5 + 18 + (i * 13), _print);
		draw_set_alpha(1.0);
	}
}