/// @desc Створює підменю. Опці додаються так: [["Name", function, argument, selectable], [...]]
/// @param {any*} _options options
function sub_menu(_options){
	//Зберегти старі опці та збільшити рівень субменю
	options_above[sub_menu_level]	= options;
	sub_menu_level++;
	options							= _options;
	hover							= 0;
}