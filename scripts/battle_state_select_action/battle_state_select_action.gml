function battle_state_select_action(){
	
	if (!instance_exists(obj_menu)) {
		var _unit = units[turn];
		var _conscious = true;
		
		// \/ Статус-ефекти \/
		if (array_length(_unit.status_effects) > 0) {
			for (var i = array_length(_unit.status_effects) - 1; i >= 0 ; i--) {
				var _effect = _unit.status_effects[i];
				
				if (_effect.turns_passed < _effect.duration) {
					_effect.func(_unit);
					_effect.turns_passed++;
				}
				else {
					battle_remove_status(_unit, _effect);
				}
			}
		}
		// /\ Статус-ефекти /\
		//Чи при свідомості
		for (var i = array_length(_unit.status_effects) - 1; i >= 0; i--) {
			if (_unit.status_effects[i].name == global.status_effects.unconscious.name) { 
				_conscious = false;
			}
		}
		_unit.image_index = _unit.sprites.idle;
		//Перевірка на дієздатність
		if (!instance_exists(_unit)) || (_unit.hp <= 0){
			battle_state = battle_state_victory_check;
			exit;
		}
		if (_conscious) {
			//Чи контролюється гравцем
			if (_unit.object_index == obj_battle_unit_PC) {
				
				var _menu_options	= [];
				var _sub_menus		= {};
				//Дії
				var _action_list = _unit.actions;
				for (var i = 0; i < array_length(_action_list); i++) {
					var _action = _action_list[i];
					var _available = (_action.ep_cost / 2 <= _unit.ep); //Якщо персонаж має меньш, ніж 50% потрібної енергії - опція недоступна
					var _name_and_count = _action.name;
					if (_action.sub_menu == -1) {
						array_push(_menu_options, [_name_and_count, menu_select_action, [_unit, _action], _available]);
					}
					else {
						//Додати або створити субменю
						if (is_undefined(_sub_menus[$ _action.sub_menu])) {
							variable_struct_set(_sub_menus, _action.sub_menu, [[_name_and_count, menu_select_action, [_unit, _action], _available]]);
						}
						else {
							array_push(_sub_menus[$ _action.sub_menu], [_name_and_count, menu_select_action, [_unit, _action], _available]);
						}
					}
				}
				//Предмети
				var _items = global.items;
				var _items_names = struct_get_names(_items);
				for (var i = 0; i < array_length(_items_names); i++) {
					if (struct_get(_items, _items_names[i]).count > 0) {
						var _item = struct_get(_items, _items_names[i]);
						var _name_and_count = _item.name + " x " + string(_item.count);
						//Додати або створити субменю
						if (is_undefined(_sub_menus[$ _item.sub_menu])) {
							variable_struct_set(_sub_menus, _item.sub_menu, [[_name_and_count, menu_select_action, [_unit, _item], true]]);
						}
						else {
							array_push(_sub_menus[$ _item.sub_menu], [_name_and_count, menu_select_action, [_unit, _item], true]);
						}
					}
				}
				//Перетворити субменю на array
				var _sub_menus_array = variable_struct_get_names(_sub_menus);
				
				for (var i = 0; i < array_length(_sub_menus_array); i++) {
					//Тут відстортувати за потреби
					
					//Додати кнопку "Назад"
					array_push(_sub_menus[$ _sub_menus_array[i]], ["BACK", menu_go_back, -1, true]);
					array_push(_menu_options, [_sub_menus_array[i], sub_menu, [_sub_menus[$ _sub_menus_array[i]]], true]);
				}
				menu(x, y+100, _menu_options, , 74, 100);
			}
			else {
				var _enemy_action = _unit.ai_script();
				if (_enemy_action != -1) begin_action(_unit.id, _enemy_action[0], _enemy_action[1]);
			}
		}
		else {
			begin_action(_unit, global.action_library.standby, -1);
		}
	}
}