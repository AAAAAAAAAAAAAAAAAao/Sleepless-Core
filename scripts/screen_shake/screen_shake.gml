function screen_shake(_shake_magnitude, _shake_lenght){
    with (global.ins_camera){
        if (_shake_magnitude > shake_remain){
            shake_magnitude = _shake_magnitude;
            shake_remain    = shake_magnitude;
            shake_lenght    = _shake_lenght;
        }
    }
}