global.menu_options = [
	{
		name:	"Main",
		title:	"Start or Continue Game",
		submenu: [
			{
				name: 			"BEGIN",
				usable: 		false,
				description:	-1,
				script_step:	-1,
				script_draw:	-1
			},
			{
				name: 			"Start a New Game",
				usable: 		true,
				description:	"Begin a new\ngame from an\nempty save\nfile",
				script_step: 	function (){
					var _empty_save_available = false;
					for (var _slot = 0; _slot <= 2; _slot++) {
						var _filename 	= "save" + string(_slot) + ".save";
						
						if (!file_exists(_filename)) {
							_empty_save_available = true;
							global.game_save_slot = _slot;
							transition(TRANS_TYPE.FADE, r_mikesHouse_mikesRoom);
							break;
						}
					}
					global.is_submenu_selected = false;
				},
				script_draw:	function  (){
					//-
				}
			},
			{
				name: 			"Chose a New Save File",
				usable: 		true,
				description:	"Choose an\nempty save\nfile or\noverride\nexisting ones\nto start\nplaying",
				script_step:	function (){
					if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter)) {
						global.game_save_slot 		= global.submenu2_selected;
						transition(TRANS_TYPE.FADE, r_mikesHouse_mikesRoom);
					}
				},
				script_draw:	function (){
					draw_sprite(spr_menu_file_select, 0, 95, 120);
					
					for (var _slot = 0; _slot <= 2; _slot++) {
						var _filename 	= "save" + string(_slot) + ".save";
						var _string		= "Save file " + string(_slot);
						
						if (!file_exists(_filename)) 			_string += " - Empty";
						
						draw_set_colour(#A7A5A9);
						if (global.submenu2_selected == _slot) 	draw_set_colour(#F9FFFF);
						
						
						draw_text(110, 133 + _slot * 14, string_ext(_string, [_slot + 1]));
						draw_set_colour(c_white);
					}
				}
			},
			{
				name: 			"CONTINUE",
				usable:			false,
				description:	-1,
				script:			-1,
				script_step:	-1,
				script_draw:	-1
			},
			{
				name:			"Select Save File",
				usable:			true,
				description:	"Select a save\nfile to\ncontinue\nplaying",
				script_step: 	function (){
					if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter)) {
						global.game_save_slot 		= global.submenu2_selected;
						load_game(global.game_save_slot)
					}
					
					
					
				},
				script_draw:	function  (){
					draw_sprite(spr_menu_file_select, 0, 95, 120);
					
					for (var _slot = 0; _slot <= 2; _slot++) {
						var _filename 	= "save" + string(_slot) + ".save";
						var _string		= "Save file " + string(_slot);
						
						if (!file_exists(_filename)) 			_string += " - Empty";
						
						draw_set_colour(#A7A5A9);
						if (global.submenu2_selected == _slot) 	draw_set_colour(#F9FFFF);
						
						
						draw_text(110, 133 + _slot * 14, string_ext(_string, [_slot + 1]));
						draw_set_colour(c_white);
					}
				}
			}]
	},
	{
		name:	"Save Data",
		title:	"Check your save files",
		submenu: [
			{
				name: "SAVES",
				usable: false,
				description: -1,
				script_step: -1,
				script_draw: -1
			},
			{
				name: "Select Save",
				usable: true,
				description: "Select a save\nfile to view\nits data",
				script_step: function(){
					if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter)) {
						global.game_save_slot 		= global.submenu2_selected;
						global.is_submenu_selected 	= false;
					}
				},
				script_draw: function(){
					draw_sprite(spr_menu_file_select, 0, 95, 120);
					
					for (var _slot = 0; _slot <= 2; _slot++) {
						var _filename 	= "save" + string(_slot) + ".save";
						var _string		= "Save file " + string(_slot);
						
						if (!file_exists(_filename)) 			_string += " - Empty";
						
						draw_set_colour(#A7A5A9);
						if (global.submenu2_selected == _slot) 	draw_set_colour(#F9FFFF);
						
						
						draw_text(110, 133 + _slot * 14, string_ext(_string, [_slot + 1]));
						draw_set_colour(c_white);
					}
				}
			},
			{
				name: "SAVE ACTIONS",
				usable: false,
				description: -1,
				script_step: -1,
				script_draw: -1
			},
			{
				name: "Delete Selected Save",
				usable: true,
				description: "Delete current\nselected save\nfile",
				script_step: function(){
					var _filename 	= "save" + string(global.game_save_slot) + ".save";
					if (file_exists(_filename)) {
						file_delete(_filename);
						global.game_save_slot = -1;
					}
					global.is_submenu_selected = false;
				},
				script_draw: function(){}
			},
			{
				name: "-1",
				usable: false,
				description: -1,
				script_step: -1,
				script_draw: -1
			}]
	},
	{
		name: "Settings",
		title: "Customise game",
		submenu: [
			{
				name: "SCREEN SETTINGS",
				usable: false,
				description: -1,
				script_step: -1,
				script_draw: -1
			},
			{
				name: "-1",
				usable: true,
				description: "Toggle to play\nin a window or \non a full \nscreen",
				script_step: function (){
					global.settings.fullscreen = !global.settings.fullscreen;
					global.is_submenu_selected = false;
				},
				script_draw: -1
			},
			{
				name: "-1",
				usable: true,
				description: "Toggle to\ndisable delay\non the start\nof the game",
				script_step: function (){
					global.settings.startup_timer = !global.settings.startup_timer;
					global.is_submenu_selected = false;
				},
				script_draw: -1
			},
			{
				name: "-1",
				usable: true,
				description: "Toggle to\ndisable\nblinking when\nchanging\nsubmenus\nin main menu",
				script_step: function (){
					global.settings.blink = !global.settings.blink;
					global.is_submenu_selected = false;
				},
				script_draw: -1
			},
			{
				name: "Save",
				usable: true,
				description: "Save settings",
				script_step: function (){
					save_settings();
					global.is_submenu_selected = false;
				},
				script_draw: -1
			}]
	},
	{
		name: "System",
		title: "Quit Game",
		submenu: [
			{
				name: "QUIT GAME",
				usable: false,
				description: -1,
				script_step: -1,
				script_draw: -1
			},
			{
				name: "Quit Game",
				usable: true,
				description: "End your\ngaming session",
				script_step: function (){
					game_end();
				},
				script_draw: -1
			}]
	}
];