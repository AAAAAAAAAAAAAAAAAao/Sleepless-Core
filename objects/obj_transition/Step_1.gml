with (obj_player) state = player_state_trasition;

if (leading == IN){
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <=0){											//Екран пустий
		with (obj_player) state = player_state_free;
		instance_destroy();
	} 
}
else{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >=1){											//Екран заповнений
		room_goto(target_room);
		leading = IN;
	}
}