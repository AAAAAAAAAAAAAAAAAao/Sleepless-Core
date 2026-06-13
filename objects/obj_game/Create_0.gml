//ініціалізація та глобальні змінні
randomize();

global.game_paused		= false;
global.text_speed		= 0.5;
global.target_room		= -1;
global.target_x			= -1;
global.target_y			= -1;
global.target_direction	= 0;
global.ins_lifted		= noone;

global.xp				= 0;

global.player_has_any_items = false;
global.player_equiped 		= TEST_ITEM.BOMB;
global.player_ammo			= array_create(TEST_ITEM.TYPE_COUNT, -1);
global.player_item_unlocked	= array_create(TEST_ITEM.TYPE_COUNT, false);
global.player_ammo[TEST_ITEM.BOMB] = 0;

global.player_item_unlocked[TEST_ITEM.BOMB] = true;
global.player_has_any_items = true;
global.player_ammo[TEST_ITEM.BOMB] = 5;

//Потім винести 
global.quest_status		= ds_map_create();
global.quest_status[? "TEST_quest"]	= 0;

global.ins_camera		= instance_create_layer(0, 0, layer, obj_camera);
global.ins_ui			= instance_create_layer(0, 0, layer, obj_ui);

toggle = -1 //для повного екрану

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

room_goto(ROOM_START);