/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


event_inherited();

move_speed = 1.5;
max_hp = 120;
hp = max_hp;

target_x = x;
target_y = y;

distance_check = 100;
last_distance = 0;
throw_chains = 0;
throw_chains_delay = 30;
hit_player = false;

attack_cooldown_max = obj_control.game_speed*2.5;

rear = function(){
	//instance_create_layer(x,y,layer,obj_swipe);
	throw_chains = 2;
	trigger_animation(15,attack,spr_chainer_rearing);
}

attack = function(){
	//trigget_animation(10,wait,spr_swiper_swiping);
	reset_animation();
	throw_chains = 0;
	hit_player = false;
}

inherited_reset_animation = reset_animation;

reset_animation = function(){
	//sprite_index = default_sprite;
	//animation_callback = noone;
	//animation_delay = 0;
	method_call(inherited_reset_animation,[]);
	throw_chains = 0;
}