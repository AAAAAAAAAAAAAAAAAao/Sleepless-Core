function dialogue_responses(_number){
    switch (_number) {
        case 0: break;
        case 1: new_textbox(">Uhuh."); break;
        case 2: new_textbox(">Bah!\n Yon got me interested.", 0, c_lime, ["3:Tell more", "0:Nah, you're mad"]); break;
        case 3: new_textbox(">Oh, damn."); break;
		case 4: new_textbox(">Dirty."); break;
		case 5: {
			new_textbox(">I will rememmber your kindness.");
			new_textbox(">It's about here.");
			global.quest_status[? "TEST_quest"] = 1;
		}break;
		case 6: new_textbox(">I will rememmber your cruelness.") break;
		case 7: game_restart() break;
		case 8: game_end() break;
        default: break;
    }
}