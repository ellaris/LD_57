/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


move_speed = 3;


sword_cooldown = 0
sword_cooldown_max = obj_control.game_speed*0.4;
sword_animation_delay = 6;
sword_summon_side = 0;

dodge_count = 0;
dodge_dir = 0;
dodge_cooldown = 0;
dodge_cooldown_max = obj_control.game_speed*2.0;


animation_delay = 0;
animation_callback = noone;
animation_sprite = spr_player;

special_cooldown = 0;
special_cooldown_max = obj_control.game_speed*3.5;
special_delay = 25;

trigger_animation = function(_delay, _callback, _sprite)
{
	animation_delay = _delay;
	animation_callback = _callback;
	sprite_index = _sprite;
	image_speed = sprite_get_number(_sprite)/_delay;
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
	sword_cooldown = sword_cooldown_max;
	trigger_animation(2,reset_animation,spr_player_casting);
}

dodge = function(){
	if(dodge_count == 0)
		instance_create_layer(x,y,layer,obj_after_image);
	
	if(dodge_count < 4)
		dodge_count += 1
	else
	{
		dodge_count = 0;
		reset_animation();
	}
	
	x += lengthdir_x(move_speed*3, dodge_dir);
	y += lengthdir_y(move_speed*3, dodge_dir);
}

take_damage = function(){
	obj_control.set_text_bubble(choose("Ow, that's a deep cut","That deeply hurt!"))
}

special_attack = function(){
	instance_create_layer(mouse_x,mouse_y,layer,obj_depth_palm);
	special_cooldown = special_cooldown_max;
	trigger_animation(15,reset_animation,spr_player_casting);
}