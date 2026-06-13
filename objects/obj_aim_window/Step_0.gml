//Переміщення ворога (або ворогів)
for (var j = 0; j < enemy_count; j++) {
	var _enemy = enemy_data[j];
	
	for (var i = 0; i < 4; i++) {
		var _res = _enemy.evade_script(_enemy.x, _enemy.y, _enemy.x_to, _enemy.y_to, i, time_passed, gun_restrict_x1, gun_restrict_x2, gun_restrict_y1, gun_restrict_y2);
		
		switch (i) {
			case 0: _enemy.x = _res; break;
            case 1: _enemy.y = _res; break;
            case 2: if (!is_undefined(_res)) _enemy.x_to = _res; break;
            case 3: if (!is_undefined(_res)) _enemy.y_to = _res; break;
		}
	}
	
	//Для хвоств ілюізій
	if (!_enemy.is_real) {
		
		//Додавання післяфото в масив
		array_push(_enemy.trail, [_enemy.x, _enemy.y, 1.0]);
		
		//Видалення останнього
		if (array_length(_enemy.trail) > 20) array_delete(_enemy.trail, 0, 1);
	}
	
	enemy_data[j] = _enemy;
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
if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter)) and (!shot) {
	shot = true;
	
	//Якщо Маша
	if (global.aim_user.name == global.party[1].name) {
		//Коли стріляє, 5% шанс отримати баф на 25% урону
		var _dice = irandom_range(1,100);
		if (_dice <= 5) {
			battle_add_status(global.aim_user, global.status_effects.ATK_buff25);
		}
	}
}

if (shot) {
	var bullet_x = aim_x;
	var bullet_y = aim_y + 16; //Чомусь вистрелювало на 16 px вище
	
	
	//Чи попав, по всім
	for (var i = 0; i < enemy_count; i++) {
		var _enemy 			= enemy_data[i];
		var _sprite_width 	= sprite_get_width(enemy_sprite) * 0.5;
		var _sprite_heigth 	= sprite_get_height(enemy_sprite) * 0.5;
		
		//Чи попав
		if (bullet_x >= _enemy.x - _sprite_width and bullet_x <= _enemy.x + _sprite_width and bullet_y >= _enemy.y - _sprite_heigth and bullet_y <= _enemy.y + _sprite_heigth and !scored){
			if (_enemy.is_real) {
				scored = true;
				hit_target = global.aim_target;
				break;
			}
			
			if (_enemy.is_real) break;
		}
	}
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
	//Анімація того, хто стріляє
	global.aim_user.sprite_index 	= global.aim_user.sprites.shoot;
	window_alpha 	= lerp(window_alpha, 0, animation_speed);
	gun_alpha 		= lerp(gun_alpha, 0, animation_speed);
	enemy_alpha 	= lerp(enemy_alpha, 0, animation_speed);
	//Вліпив все таки сюди атаку
	if (window_alpha <= 30) {
		if (scored and hit_target != noone) {
			battle_change_hp(hit_target, -global.aim_user.atk);
		}
		else {
			battle_change_hp(global.aim_target, 0);
		}
		
		battle_change_ep(global.aim_user, -global.action_library.attack.ep_cost);
		instance_destroy();
	}
}