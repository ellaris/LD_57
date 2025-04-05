/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

//image_speed = hp/max_hp;

if(attack_cooldown > 0)
	attack_cooldown -= 1;
	
if(animation_delay > 0)
	animation_delay -= 1;

if(animation_delay == 0 and animation_callback)
	method_call(animation_callback,[]);


if(x < 32+16)
	x = 32+16;
if(x > room_width-16)
	x = room_width-16;
if(y < 16)
	y = 16;
if(y > room_height-16)
	y = room_height-16;
	
if(target_x < 32+16)
	target_x = 32+16;
if(target_x > room_width-16)
	target_x = room_width-16;
if(target_y < 16)
	target_y = 16;
if(target_y > room_height-16)
	target_y = room_height-16;