draw_sprite_stretched_ext(spr_textBox_bg, background, x1, y1, x2, 110, c_white, lerp_progress*4);
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(text_color);
var _print = string_copy(message, 1, text_progress);

if (responses[0] != -1) and (text_progress >= string_length(message)){
    for (var i = 0; i < array_length_1d(responses); i++){ 
        _print += "\n";
        _print += responses[i];
        if (i == response_selected){
            _print += " <";
        }
    }
}


draw_text(x1 + 20, y1 + 16, _print);