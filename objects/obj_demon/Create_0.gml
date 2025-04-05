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
default_sprite = spr_swiper;


take_damage = function(_dmg){
	hp -= _dmg;
	if(hp <= 0)
		instance_destroy();
	image_speed = hp/max_hp;
	
	part_particles_create(obj_control.particle_sword_hit_system,x,y,obj_control.particle_blood_drip_part,5);
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