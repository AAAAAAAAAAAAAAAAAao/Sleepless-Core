instance_deactivate_all(true);
draw_set_font(fnt_text);

toggle = -1; //Тимчасово

units						= [];
turn						= 0;
unit_render_order			= [];

round_count					= 0;

battle_wait_time_frames		= 60; 
battle_wait_time_remaining	= 0;

battle_text					= "";
current_user				= noone;
current_targets				= noone;
battle_log_length 			= 1;

global.battle_log			= ["Battle started"]; //Global, щоб з інших функцій додавати логи. Тут всеодно очищається
global.battle_won			= false; //Global для анімації з перевірки того, чи виргав гравець
victiry_message_added		= false;
victory_confirmed			= false; //Для отримання повідомлення про отримування предметів та XP після битви

xp_pending					= 0;

aim_window_id 				= noone;
global.aim_target			= noone;
global.aim_user				= noone;

//Для анімації
bottom_ui_y				= y + 300; // до y + 200
bottom_ui_text_alpha 	= 0; //до 100
bg_alpha				= 0; //до 100
all_fade_out			= 0; //до 100

log_last_chars = 0; //Для ефекту друкарсько машинки на лог

//Курсор
cursor = {
	active_user:	noone,
	active_target:	noone,
	active_action:	-1,
	target_side:	-1,
	target_index:	0,
	target_all:		false,
	confirm_delay:	0,
	active: 		false
};

//Для своїх
for (var i = 0; i < array_length(global.party); i++){
	party_units[i] = instance_create_depth(	x + 100 + ((i-1)*15), 
											y + 150 - ((i-1)*30), 
											depth - 10,
											obj_battle_unit_PC,
											global.party[i]
											);
	array_push(units, party_units[i]);
	
}

//Для ворогів
for (var i = 0; i < array_length(enemies); i++){
	enemy_units[i] = instance_create_depth(	x + 300 - ((i-1)*15), 
											y + 150 - ((i-1)*30), 
											depth - 10,
											obj_battle_unit_enemy,
											variable_clone(enemies[i])
											);
	xp_pending += obj_battle.enemy_units[i].xp_value;
	array_push(units, enemy_units[i]);
	
}

refresh_render_order = function() {
	unit_render_order = [];
	array_copy(unit_render_order, 0, units, 0, array_length(units));
	array_sort(unit_render_order, function(_1, _2){
		return _1.y - _2.y;
	});
}
refresh_render_order();

battle_state = battle_state_select_action;