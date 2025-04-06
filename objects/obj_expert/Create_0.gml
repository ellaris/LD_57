/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


move_speed = 3;

heal_value = 1/obj_control.game_speed;


sword_cooldown = 0
sword_cooldown_max = obj_control.game_speed*0.3;
sword_animation_delay = 5;
sword_summon_side = 0;
sword_hits = 3;
sword_strength = 10;
sword_speed = 6;
sword_turn_speed = 11;

sword_casts = 1;
sword_casts_left = 0;

dodge_count = 0;
dodge_count_max = 4;
dodge_dir = 0;
dodge_cooldown = 0;
dodge_cooldown_max = obj_control.game_speed*2.0;


animation_delay = 0;
animation_callback = noone;
animation_sprite = spr_player;

special_cooldown = 0;
special_cooldown_max = obj_control.game_speed*3.2;
special_delay = 25;
special_flurry_hits = 3;

sword_array_cooldown = 0;
sword_array_cooldown_max = obj_control.game_speed*4.5;
sword_array_delay = 12;
sword_array_gap = 32;

push_back_cooldown = 0;
push_back_cooldown_max = obj_control.game_speed*5;
push_back_delay = 5;
push_back_damage_range = 128;
push_back_push_range = 128*2;

hp_head_max = 30;
hp_head = hp_head_max;

hp_torso_max = 60;
hp_torso = hp_torso_max;

hp_hand_left_max = 30;
hp_hand_left = hp_hand_left_max;

hp_hand_right_max = 30;
hp_hand_right = hp_hand_right_max;

hp_leg_left_max = 30;
hp_leg_left = hp_leg_left_max;

hp_leg_right_max = 30;
hp_leg_right = hp_leg_right_max;

//			head	torso	left_hand	right_hand	left_leg	right_leg
hp_bars = [hp_head, hp_torso, hp_hand_left, hp_hand_right, hp_leg_left, hp_leg_right];
hp_bars_max = [hp_head_max, hp_torso_max, hp_hand_left_max, hp_hand_right_max, hp_leg_left_max, hp_leg_right_max]

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
	_sword.hits = sword_hits;
	_sword.strength = sword_strength;
	_sword.speed = sword_speed;
	_sword.turn_speed = sword_turn_speed;
	
	sword_summon_side = not sword_summon_side;
	sword_cooldown = sword_cooldown_max;
	
	sword_casts_left -= 1;
	if(sword_casts_left > 0)
		trigger_animation(3,summon_sword,spr_player_casting);
	else
		trigger_animation(4,reset_animation,spr_player_casting);
}

dodge = function(){
	if(dodge_count == 0)
	{
		audio_play_sound(snd_dodge,4,false);
		instance_create_layer(x,y,layer,obj_after_image);
		if(instance_exists(obj_follower))
		{
			var _follower = instance_create_layer(obj_follower.x,obj_follower.y,layer,obj_after_image);
			_follower.sprite_index = spr_npc_child;
		}
	}
	
	if(dodge_count < dodge_count_max)
		dodge_count += 1;
	else
	{
		dodge_count = 0;
		reset_animation();
	}
	
	x += lengthdir_x(move_speed*3, dodge_dir);
	y += lengthdir_y(move_speed*3, dodge_dir);
}

take_damage = function(_dmg = 5){
	if(obj_control.speech_bubble_text == "" and irandom(2) == 0)
		obj_control.set_text_bubble(choose("Ow, that's a deep cut","That deeply hurt!","I feel deep shame for not avoiding taht one","My bad mood deepens"))

	audio_play_sound(snd_player_hit,1,false);
	
	hp_bars[irandom(array_length(hp_bars)-1)] -= _dmg;

	part_particles_create(obj_control.particle_sword_hit_system,x,y,obj_control.particle_blood_drip_part,10);
}

special_attack = function(){
	var _fist = instance_create_layer(mouse_x,mouse_y,layer,obj_depth_palm);
	_fist.hits = special_flurry_hits;
	special_cooldown = special_cooldown_max;
	trigger_animation(15,reset_animation,spr_player_casting);
	
	if(instance_exists(obj_follower))
	{
		var _fist = instance_create_layer(room_width/3+irandom(room_width/3),room_height/3+irandom(room_height/3),layer,obj_depth_palm);
		_fist.hits = floor(special_flurry_hits/2);
		_fist.arrival = 30+irandom(30);
		_fist.strength = 5;
		_fist.image_xscale = 0.5;
		_fist.image_yscale = 0.5;
	}
}

sword_array = function(){
	
	with(obj_sword)
	{
		var _e = instance_nearest(x,y,obj_demon);
		if(_e)
		{
			target_x = _e.x;
			target_y = _e.y;
		}
		hits = floor(other.sword_hits*1.34);
		strength = floor(other.sword_strength*1.2);
		life = 0;
		speed += 1;
		turn_speed += 3;
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	
	for(var i = 0; i < room_width/sword_array_gap; i++)
	{
		var _sword = instance_create_layer(8+i*sword_array_gap,-8,layer,obj_sword);
		_sword.image_xscale = 2;
		_sword.image_yscale = 2;
		_sword.direction = 270;
		_sword.target_x = _sword.x;
		_sword.target_y = room_height/2;
		_sword.strength = 20;
		_sword.hits = 4;
	}
	
	sword_array_cooldown = sword_array_cooldown_max;
	
	trigger_animation(15,reset_animation,spr_player_casting);
}

push_back = function(){
	
	with(obj_demon)
	{
		var _dis = point_distance(x,y,other.x,other.y);
		if(_dis < other.push_back_damage_range)
		{
			take_damage(20);
		}
		if(_dis < other.push_back_push_range)
		{
			trigger_animation(1,push,default_sprite);
			push_strength = 20;
			push_direciton = point_direction(other.x,other.y,x,y);
		}
	}
	
	for(var i = 0; i < instance_number(obj_sword); i++)
	{
		var _dir = 360/instance_number(obj_sword);
		var _sword = instance_find(obj_sword, i);
		_sword.target_x = x+lengthdir_x(push_back_damage_range/2,_dir*i);
		_sword.target_y = y+lengthdir_y(push_back_damage_range/2,_dir*i);
		_sword.hits = sword_hits;
		_sword.strength = sword_strength;
		_sword.speed = sword_speed;
		_sword.turn_speed = sword_turn_speed;
		_sword.life = 0;
	}
	
	push_back_cooldown = push_back_cooldown_max;
	trigger_animation(25,reset_animation,spr_player_casting);
}