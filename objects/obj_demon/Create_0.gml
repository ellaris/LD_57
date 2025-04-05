/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

max_hp = 100;
hp = max_hp;

move_speed = 3;

animation_delay = 0;
animation_callback = noone;
animation_sprite = spr_swiper;

attack_cooldown = 0;
attack_cooldown_max = obj_control.game_speed*1;


take_damage = function(_dmg){
	hp -= _dmg;
	if(hp <= 0)
		instance_destroy();
	image_speed = hp/max_hp;
}

trigger_animation = function(_delay, _callback, _sprite)
{
	animation_delay = _delay;
	animation_callback = _callback;
	sprite_index = _sprite;
	image_speed = _delay/sprite_get_number(_sprite);
}

reset_animation = function(){
	sprite_index = spr_player;
	animation_callback = noone;
	animation_delay = 0;
}

wait = function(){
	reset_animation();	
}