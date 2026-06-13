//Переміщення ворога
for (var i = 0; i < 4; i++) {
	var new_var = undefined;
	switch (i) {
		case 0: enemy_x 	= enemy_evade_script(enemy_x, enemy_y, enemy_x_to, enemy_y_to, i, time_passed, gun_restrict_x1, gun_restrict_x2, gun_restrict_y1, gun_restrict_y2); break;
		case 1: enemy_y 	= enemy_evade_script(enemy_x, enemy_y, enemy_x_to, enemy_y_to, i, time_passed, gun_restrict_x1, gun_restrict_x2, gun_restrict_y1, gun_restrict_y2); break;
		case 2: new_var 	= enemy_evade_script(enemy_x, enemy_y, enemy_x_to, enemy_y_to, i, time_passed, gun_restrict_x1, gun_restrict_x2, gun_restrict_y1, gun_restrict_y2); if (!is_undefined(new_var)) enemy_x_to = new_var; break;
		case 3: new_var 	= enemy_evade_script(enemy_x, enemy_y, enemy_x_to, enemy_y_to, i, time_passed, gun_restrict_x1, gun_restrict_x2, gun_restrict_y1, gun_restrict_y2); if (!is_undefined(new_var)) enemy_y_to = new_var; break;
	}
}


//управління 
var key_left    = keyboard_check(vk_left)          or keyboard_check(ord("A"));
var key_right   = keyboard_check(vk_right)         or keyboard_check(ord("D"));
var key_up      = keyboard_check(vk_up)            or keyboard_check(ord("W"));
var key_down	= keyboard_check(vk_down)          or keyboard_check(ord("S"));
var key_shoot	= keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);

//контроль переміщення
var _h = key_right - key_left;
var _v = key_down - key_up;

if (_h != 0 || _v != 0) {
	var _dir = point_direction(0, 0, _h, _v);
	gun_front_hor_speed += lengthdir_x(gun_front_speed, _dir);
	gun_front_ver_speed += lengthdir_y(gun_front_speed, _dir);
}

//Лід
gun_front_hor_speed *= gun_friction;
gun_front_ver_speed *= gun_friction;

gun_front_x = clamp(gun_front_x + gun_front_hor_speed, gun_restrict_x1, gun_restrict_x2);
gun_front_y = clamp(gun_front_y + gun_front_ver_speed, gun_restrict_y1, gun_restrict_y2);
gun_back_x = clamp(lerp(gun_back_x, gun_front_x, gun_back_follow), gun_front_x - 10, gun_front_x + 10);
gun_back_y = clamp(lerp(gun_back_y, gun_front_y, gun_back_follow), gun_front_y - 10, gun_front_y + 10);

var aim_dir = point_direction(gun_back_x, gun_back_y, gun_front_x, gun_front_y);

var _distance = point_distance(gun_back_x, gun_back_y, gun_front_x, gun_front_y) * 3;

var aim_x = gun_back_x + lengthdir_x(_distance, aim_dir);
var aim_y = gun_back_y + lengthdir_y(_distance, aim_dir);

//Стрільба
if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter)) and (!shot) shot = true;

if (shot) {
	var bullet_x = aim_x;
	var bullet_y = aim_y + 16; //Чомусь вистрелювало на 16 px вище
	
	show_debug_message("x:" + string(bullet_x) + " y:" + string(bullet_y));
	//Чи попав

	var _left = enemy_x - sprite_get_width(enemy_sprite) * 0.5;
	var _right = enemy_x + sprite_get_width(enemy_sprite) * 0.5;
	var _top = enemy_y - sprite_get_height(enemy_sprite) * 0.5;
	var _bottom = enemy_y + sprite_get_height(enemy_sprite) * 0.5;
	
	
	if (bullet_x >= _left and bullet_x <= _right and 
		bullet_y >= _top and bullet_y <= _bottom and !scored
	) scored = true;
}


//Час
if (time_passed < time_to_shoot) {
	time_passed++;
	//І трішки анімації
	var _time = time_passed / time_to_shoot;
	time_bar_width = time_bar_init_width * (1 - _time);
	
}
else shot = true;

//Змінні для анімацій
if (!shot) window_alpha = lerp(window_alpha, 100, animation_speed);

if (window_alpha >= 30) and !scored {
	gun_alpha 	= lerp(gun_alpha, 100, animation_speed);
	enemy_alpha = lerp(enemy_alpha, 100, animation_speed);
}

if (shot) {
	window_alpha 	= lerp(window_alpha, 0, animation_speed);
	gun_alpha 		= lerp(gun_alpha, 0, animation_speed);
	enemy_alpha 	= lerp(enemy_alpha, 0, animation_speed);
	//Вліпив все таки сюди атаку
	if (window_alpha <= 30) and(shot) {
		var _damage = 0;
		
		if (scored) _damage = ceil(global.aim_user.atk + random_range(-global.aim_user.atk * 0.25, global.aim_user.atk * 0.25));
		
		battle_change_hp(global.aim_target, -_damage, 0);
		battle_change_ep(global.aim_user, -global.action_library.attack.ep_cost);
		instance_destroy();
	}
}