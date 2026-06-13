//Кастумізація
gun_front_speed = global.aim_user.gun_front_speed; 	//Чутливість
gun_back_follow = global.aim_user.gun_back_follow; 	//Інерція
gun_friction 	= global.aim_user.gun_friction;   	//Ковзання
scope 			= global.aim_user.scope_type;		//Тип прицілу

//стрільба
gun_front_hor_speed = 0;
gun_front_ver_speed = 0
gun_back_hor_speed	= 0;
gun_back_ver_speed 	= 0;

gun_front_x	= x + 300;
gun_front_y = y + 200;

gun_back_x	= x + 300;
gun_back_y	= x + 300;

gun_restrict_x1 = AIM_WINDOW_X1 + 32;
gun_restrict_x2 = AIM_WINDOW_X2 - 36;
gun_restrict_y1 = AIM_WINDOW_Y1 + 29;
gun_restrict_y2 = AIM_WINDOW_Y2 - 56;

shot 			= false;
scored 			= false;
hit_target		= noone;

//Час
time_bar_margin 	= 10;
time_to_shoot 		= 180; // 3 секунди
time_passed 		= 0;
time_bar_init_width	= AIM_WINDOW_W - time_bar_margin * 2;
time_bar_width 		= time_bar_init_width;

//Вигляд
animation_speed	= 0.1;

window_alpha 	= 0;
gun_alpha 		= 0;
enemy_alpha 	= 0;

enemy_sprite_index = 0;

//Ворог
enemy_x_to 	= random_range(gun_restrict_x1, gun_restrict_x2);
enemy_y_to 	= random_range(gun_restrict_y1, gun_restrict_y2);
enemy_x 	= enemy_x_to;
enemy_y		= enemy_y_to;

enemy_sprite		= global.aim_target.sprites.facing;
show_debug_message(enemy_sprite);
enemy_evade_script 	= global.aim_target.evade_script;

depth = obj_battle.depth - 10;

//Вийняток
is_illusionist = false;

enemy_count = 1;
enemy_data 	= [];

//Якщо іллюзіоніст, додати до кількості ворогів 1-4
if (global.aim_target.name == "Illusionist") { 
    is_illusionist = true;
    enemy_count = irandom_range(2, 5); 
} 

//Заповнення ілюзіоністів даними
for (var i = 0; i < enemy_count; i++) {
	enemy_data[i] = {
		x: 		random_range(gun_restrict_x1, gun_restrict_x2),
		y: 		random_range(gun_restrict_y1, gun_restrict_y2),
		x_to: 	random_range(gun_restrict_x1, gun_restrict_x2),
		y_to: 	random_range(gun_restrict_y1, gun_restrict_y2),
		
		is_real: (i == 0), //Тільки перший реальний
		//Проблема з тим, що ефект больового шоку накладається на кількох однакових ворогів
		evade_script: enemy_evade_script,
		
		trail: [] //Для розпізнавання іллюзій
	}
}
show_debug_message("Spawned enemies: " + string(enemy_count));