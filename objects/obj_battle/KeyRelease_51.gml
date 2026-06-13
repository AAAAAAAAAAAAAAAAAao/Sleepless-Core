var _enemy_count = array_length(enemy_units);
for (var i = 0; i < _enemy_count; i++) {
	battle_change_hp(enemy_units[i], -9999, 2);
}