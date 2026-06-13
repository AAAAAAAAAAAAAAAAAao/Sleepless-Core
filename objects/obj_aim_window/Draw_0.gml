//Задній фон
draw_sprite_stretched_ext(spr_textBox_bg, 0, AIM_WINDOW_X1, AIM_WINDOW_Y1, AIM_WINDOW_W, AIM_WINDOW_H, c_white, window_alpha / 100); //300х200

//Ворог
draw_sprite_ext(enemy_sprite, 0, enemy_x, enemy_y, image_xscale, image_yscale, 0, c_white, enemy_alpha / 100);

//Час, що остався
draw_set_colour(c_white);
draw_rectangle(AIM_WINDOW_X1 + time_bar_margin, AIM_WINDOW_Y1 + time_bar_margin, AIM_WINDOW_X2 - time_bar_margin - (time_bar_init_width - time_bar_width), AIM_WINDOW_Y1 + 20, false);
draw_set_colour(c_gray);
draw_rectangle(AIM_WINDOW_X1 + time_bar_margin, AIM_WINDOW_Y1 + time_bar_margin, AIM_WINDOW_X2 - time_bar_margin, AIM_WINDOW_Y1 + 20, true);
draw_set_colour(c_white);


//зброя
if (shot) {
	draw_sprite_ext(spr_shoot_fire, 0, gun_front_x, gun_front_y + 16, image_xscale, image_yscale, 0, c_white, gun_alpha / 100);
}
draw_sprite_ext(scope.front, 0, gun_front_x, gun_front_y, image_xscale, image_yscale, 0, c_white, gun_alpha / 100);
draw_sprite_ext(scope.back, 0, gun_back_x, gun_back_y, image_xscale, image_yscale, 0, c_white, gun_alpha / 100);