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
default_sprite = sprite_index;

target_x = 0;
target_y = 0;

shadow_y_offset = 0;

take_damage = function(_dmg){
	hp -= _dmg;
	if(hp <= 0)
		instance_destroy();
	image_speed = hp/max_hp;
	
	part_particles_create(obj_control.particle_sword_hit_system,x,y,obj_control.particle_blood_drip_part,_dmg*2);
}

trigger_animation = function(_delay, _callback, _sprite)
{
	animation_delay = _delay;
	animation_callback = _callback;
	sprite_index = _sprite;
	image_speed = sprite_get_number(_sprite)/_delay;
}

reset_animation = function(){
	sprite_index = default_sprite;
	animation_callback = noone;
	animation_delay = 0;
}

stun = function(){
	reset_animation();	
}

push_strength = 0;
push_direciton = 0;
push = function(){
	if(push_strength > 0)
	{
		push_strength -= max(1,push_strength/2);
		x += lengthdir_x(push_strength, push_direciton);
		y += lengthdir_y(push_strength, push_direciton)
		trigger_animation(1,push,default_sprite);
	}
	else
		reset_animation();
	
}