/// @arg x
/// @arg y
/// @arg [items]
function drop_items(_x, _y, items = []){
	var _items = array_length_1d(items);
	
	if (_items > 1){
		var _angle_per_item = 360 / _items;
		var _angle = random(360);
		for (var i = 0; i < _items; i ++){
			with (instance_create_layer(_x, _y, "Instances", items[i])){
				direction	= _angle;
				spd			= 0.5 + (_items * 0.1) + random(0.1);
			}
			_angle += _angle_per_item;
		}
	}
	else instance_create_layer(_x, _y, "Instances", items[0]);
}