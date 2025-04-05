/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


move_speed = 3;


sword_cooldown = 0
sword_cooldown_max = obj_control.game_speed*0.6;
sword_summon_side = 0;


animation_delay = 0;
animation_callback = noone;
animation_sprite = spr_player;

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

summon_sword = function(){
	var _sword = instance_create_layer(x+10-20*sword_summon_side,y,layer,obj_sword);
	//_sword.direction = point_direction(x,y,mouse_x,mouse_y);
	_sword.direction = 180*sword_summon_side;
	_sword.set_target(mouse_x,mouse_y);
	
	sword_summon_side = not sword_summon_side;
	
	reset_animation();
}