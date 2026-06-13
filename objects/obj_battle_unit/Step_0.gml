if (hp > 0) {
	if (!global.battle_won) {
		alpha = lerp(alpha, 100, 0.05);
	}
	else {
		alpha = lerp(alpha, 0, 0.05);
	}
	image_alpha = alpha / 100.0;
}

//Зупинення при останньому кадрі
if (image_index >= image_number - 1) and (variable_struct_exists(sprites, "aim")) and (sprite_index == sprites.aim or sprite_index == sprites.shoot) {
    image_index = image_number - 1;
    image_speed = 0;
}

//Скидання швидкості анімації при оновленні спрайту
if (current_sprite != sprite_index) {
	current_sprite 	= sprite_index;
	image_speed		= 1;
	image_index		= 0;
}