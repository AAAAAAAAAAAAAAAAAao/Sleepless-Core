event_inherited();

state = ENEMY_STATE.WANDER;

spr_move = TEST_spr_enemy2;

enemy_script[ENEMY_STATE.WANDER]	= enemy_wander;
enemy_script[ENEMY_STATE.CHASE]		= enemy_chase;

