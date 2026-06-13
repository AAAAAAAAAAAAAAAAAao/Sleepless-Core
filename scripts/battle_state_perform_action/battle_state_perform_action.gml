///@description Стан бою. Якщо виконавець при свідомості, виконати дію або предмет, після чого застосувати пасивний приріст енергії
function battle_state_perform_action(){
	//перевірка виконання, щоб функція не повторювалась нескінченно
	if (current_user.acting){
		var _conscious = true;
		
		//Перевірка на свідомість
		for (var i = array_length(current_user.status_effects) - 1; i >= 0; i--) {
			if (current_user.status_effects[i].name == global.status_effects.unconscious.name) { 
				_conscious = false; 
			}
		}
		
		//На останньому кадрі анімації
		if (current_user.image_index >= current_user.image_number - 1){
			with (current_user){
				//Поставити спрайди відповідно
				if (_conscious) sprite_index = sprites.idle;
				else 			sprite_index = sprites.down;
				
				image_index	= 0;
				acting		= false;
			}
			
			//Якщо в дії є ефекти, застосувати їх.
			if (variable_struct_exists(current_action, "effect_sprite")){
				
				//Якщо ціль присутня
				if (current_action.effect_on_target == MODE.ALWAYS) || ((current_action.effect_on_target == MODE.VARIES) && (array_length(current_targets) <= 1)) {
					for (var i = 0; i < array_length(current_targets); i++){
						instance_create_depth(current_targets[i].x, current_targets[i].y, current_targets[i].depth - 1, obj_battle_effect, {sprite_index : current_action.effect_sprite});
					}
				}
				
				//Якщо ціль відсутня, намалювати ефект на виконавцю
				else {
					var _effect_sprite = current_action.effect_sprite;
					if (variable_struct_exists(current_action, "effect_sprite_no_target")) _effect_sprite = current_action.effect_sprite_no_target;
					
					instance_create_depth(x, y, depth - 100, obj_battle_effect, {sprite_index : _effect_sprite});
				}
			}
			
			//Якщо дія чогось коштує
			if (variable_struct_exists(current_action, "ep_cost")) {
				
				//Якщо у виконавця достатньо енергії
				if (current_action.ep_cost <= current_user.ep) {
					
					current_action.func(current_user, current_targets);
				}
				
				//Якщо недостатньо енергії, але якнайменьш 50% потрібної є
				else {
					
					//Якщо енергії більше, ніж 50% потрібної, застосувати формулу успіху
					var _user_ep 			= current_user.ep;
					var _action_ep 			= current_action.ep_cost;
					var _ep_missing_percent = 100 - ((_user_ep * 100) / _action_ep);
					var _success_chance 	= clamp(50 - _ep_missing_percent, 0, 50);
					
					//Кинути кубик
					var _roll = irandom_range(0, 100);
					
					//перевірити шанс
					if (_roll >= _success_chance) {
						
						current_action.func(current_user, current_targets);
					}
					
					//Інакше нічого не робити. Додати в бойовий лог
					else array_push(global.battle_log, string_ext("{0} failed to use {1}", [current_user.name, current_action.name]));
				}
			}
			
			//Безкоштовні дії
			else {
				
				current_action.func(current_user, current_targets);
				
				//Якщо предмет - забрати
				if (struct_exists(global.items, current_action.name)) {
					global.items[$ current_action.name].count--;
				}
			}
			
			// Пасивний приріст енергії
			if (current_user.hp > 0) and (current_user.ep < current_user.ep_max) battle_change_ep(current_user, current_user.ep_recorery_per_turn);
		}
	}
	
	//продовжити після зникнення ефектів
	else {
		
		//Після зникнення ефектів (якщо такі були)
		if (!instance_exists(obj_battle_effect)){
			
			//Трішки почекати
			battle_wait_time_remaining--;
			
			//І перейти в інший стан битви
			if (battle_wait_time_remaining == 0) battle_state = battle_state_victory_check;
		}
	}
}