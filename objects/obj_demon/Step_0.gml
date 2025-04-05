/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

//image_speed = hp/max_hp;

if(attack_cooldown > 0)
	attack_cooldown -= 1;
	
if(animation_delay > 0)
	animation_delay -= 1;

if(animation_delay == 0 and animation_callback)
	method_call(animation_callback,[]);
