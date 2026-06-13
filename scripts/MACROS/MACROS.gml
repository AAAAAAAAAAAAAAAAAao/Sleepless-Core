#macro FRAME_RATE	60
#macro TILE_SIZE	32
#macro CARRIDAL_DIR	round(direction/90)
#macro ROOM_START	r_title_screen //Поки r_battles, потім r_title_screen

#macro RESOLUTION_W 400
#macro RESOLUTION_H 300

#macro TRANSITION_SPEED	0.1
#macro OUT				0
#macro IN				1

//Розташування тексту в битвах
#macro COLUMN_ENEMY		5
#macro COLUMN_NAME		110
#macro COLUMN_HEALTH	210
#macro COLUMN_ENERGY	310

//Вікно прицілювання
#macro AIM_WINDOW_X1	x + 50
#macro AIM_WINDOW_Y1	y + 50
#macro AIM_WINDOW_X2	x + 350
#macro AIM_WINDOW_Y2	y + 250
#macro AIM_WINDOW_W		300
#macro AIM_WINDOW_H		200


enum ENEMY_STATE {
	IDLE,
	WANDER,
	CHASE,
	WAIT
}

enum MODE {
	NEVER 	= 0,
	ALWAYS 	= 1,
	VARIES 	= 2
}

enum TEST_ITEM {
	NONE,
	BOMB,
	TYPE_COUNT
}