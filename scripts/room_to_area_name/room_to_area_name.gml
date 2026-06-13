function room_to_area_name(_name){
	switch (_name) {
		case TEST_r_test_room: 			return "DEV FACILITY: MAIN ROOM";
		case TEST_r_test_room2: 		return "DEV FACILITY: SECONDARY ROOM";
			
		case r_mikesHouse_mikesRoom: 	return "MIKES HOUSE: MIKES ROOM";
		case r_mikesHouse_corridor: 	return "MIKES HOUSE: CORRIDOR";
		default:						return "NOWHERE: ERROR";
	}
}