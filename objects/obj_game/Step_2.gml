//пауза
if (keyboard_check_pressed(vk_escape) and (!instance_exists(obj_transition)) and (obj_ui.visible == true)){
    global.game_paused = !global.game_paused;
    show_debug_message("Toggled");
	
    if (global.game_paused){ 
        with (all){
            //зупинити анімації
            game_paused_image_speed = image_speed;
            image_speed             = 0;
        }
    }
    else{
        with (all){
            //продовжити анімації
            image_speed = game_paused_image_speed;
        }
    }
}