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

//Ворог
enemy_x_to 	= random_range(gun_restrict_x1, gun_restrict_x2);
enemy_y_to 	= random_range(gun_restrict_y1, gun_restrict_y2);
enemy_x 	= enemy_x_to;
enemy_y		= enemy_y_to;

enemy_sprite		= global.aim_target.sprites.facing;
enemy_evade_script 	= global.aim_target.evade_script;

depth	= obj_battle.depth - 10;