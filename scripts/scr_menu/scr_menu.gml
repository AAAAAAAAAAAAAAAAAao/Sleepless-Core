/// @desc Створює меню на кординатх x та y з висотою height та шириною width. Опці додаються так: [["Name", function, argument, selectable], [...]]
/// @param {any*} _x x
/// @param {any*} _y y
/// @param {any*} _options options
/// @param {real} [_description] =-1 description
/// @param {any*} [_width] width
/// @param {any*} [_height] height
function menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined){
	with (instance_create_depth(_x, _y, -99999, obj_menu)) {
		options				= _options;
		description			= _description;
		var _options_count	= array_length(_options);
		visible_options_max	= _options_count;
		
		x_margin = 10;
		y_margin = 10;
		draw_set_font(fnt_text);
		height_line = 15;
		
		
		if (_width == undefined) {
			width = 1;
			if (description != -1) width = max(width, string_width(_description));
				
			for (var i = 0; i < _options_count; i++) {
				width = max(width, string_width(_options[i][0]));
			}
			
			width_full = width + x_margin * 2;
		}
		else width_full = _width;
			
		
		
		if (_height == undefined) {
			height = height_line * (_options_count + (description != -1));
			height_full = height + y_margin * 2;
		}
		else {
			height_full = _height;
			
			//прокрутка
			if (height_line * (_options_count + (description != -1)) > _height - (y_margin * 2)) {
				scrolling = true;
				visible_options_max = (_height - y_margin * 2) div height_line;
			}
		}
	}
}