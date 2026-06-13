event_inherited();

//змінні
state		= ENEMY_STATE.IDLE;
hor_speed	= 0;
ver_speed	= 0;
x_to		= xstart;
y_to		= ystart;
dir			= 0;


agro_check			= 0;
agro_check_duration	= 5;
state_target		= state;
state_previous		= state;
state_wait			= 0;
state_wait_duration	= 0;

time_passed			= 0;
wait_duration		= 60;
wait				= 0;

//спрайти
spr_move = TEST_spr_enemy;

//функції
enemy_script[ENEMY_STATE.IDLE]		= -1;
enemy_script[ENEMY_STATE.WANDER]	= enemy_wander;
enemy_script[ENEMY_STATE.CHASE]		= enemy_chase;
enemy_script[ENEMY_STATE.WAIT]		= enemy_wait;