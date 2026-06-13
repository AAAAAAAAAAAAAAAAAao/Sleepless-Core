function save_string_to_file(_filename, _string){
	//Ця функція зберігає файл на всих платформах (Тобто підходить для телефону)
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}