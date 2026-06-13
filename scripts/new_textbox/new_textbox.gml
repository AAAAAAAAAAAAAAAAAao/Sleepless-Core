/// @desctiption Draws textbox with text
function new_textbox(_message, _background = 0, _text_color = c_lime , _Responses = -1){
    responses = [];
    var _obj;
    
    if (instance_exists(obj_text)){
        _obj = obj_text_queued;
    }
    else{
        _obj = obj_text;
    }
    with (instance_create_depth(0, 0, -9999, _obj)){
        message = _message;
        if (instance_exists(other)) origin_instance = other.id else origin_instance = noone; 
        background = _background;
        text_color = _text_color;
        if (_Responses != -1){
            //Зрізати маркери
            responses = [];
            array_copy(responses, 0, _Responses, 0, array_length(_Responses));
            for (var i = 0; i < array_length_1d(responses); i++){
                var _marker_position = string_pos(":", responses[i]);
                response_scripts[i] = string_copy(responses[i], 1, _marker_position - 1);
                responses[i]        = string_delete(responses[i], 1, _marker_position);
            }
        }
        else{
            responses        = [-1];
            response_scripts = [-1];
        }
    }
    
    with (obj_player){
        if (state != player_state_locked){
            last_state = state;
            state = player_state_locked;
        }
    }
}