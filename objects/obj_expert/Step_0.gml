/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

var _space = keyboard_check(vk_space);
var _q_ability = keyboard_check(ord("Q"));
var _e_ability = keyboard_check(ord("E"));

var _mouse_left = mouse_check_button(mb_left);
var _mouse_right = mouse_check_button(mb_right);

// hp
var _move_speed = 1;
var _cool_speed = 1;
for(var i = 0; i < array_length(hp_bars); i++)
{
	var _hp = hp_bars[i];
	var _hp_max = hp_bars_max[i];
	if(_hp < _hp_max and _hp > 0)
		hp_bars[i] += heal_value;
	if(_hp < _hp_max/2)
	{
		
		switch(i)
		{
			case 0:
			_move_speed += 0.5;
			case 2:
			case 3:
			_cool_speed += 0.5;
			break;
			case 4:
			case 5:
			_move_speed += 0.5;
			break;
			
			
		}
	}
	
	if((i == 0 or i == 1) and _hp <= 0)
	{
		if(not obj_control.game_over)
		{
			obj_control.game_over = true;
			obj_control.set_text_bubble("No, I haven't gotten nearly deep enough");
			obj_control.speech_bubble_timer = -obj_control.game_speed*30;
			with(obj_demon)
				take_damage(666);
			with(obj_npc)
				instance_destroy();
			with(obj_summoning)
				instance_destroy();
		}
		exit;
	}
}

// movement
if((_left or _right or _up or _down) and animation_callback != dodge)
{
		var _dir = point_direction(0,0,_right-_left,_down-_up);
		x += lengthdir_x(move_speed/_move_speed,_dir);
		var _y_move = lengthdir_y(move_speed/_move_speed,_dir);
		y += _y_move;
		
		// screen movement
		if(y > room_height/2 and _y_move > 0 and obj_control.level_depth < 360*2*obj_control.depth_scaling and not instance_exists(obj_npc))
		{
			if(irandom(19) == 0)
				instance_create_layer(irandom(room_width),room_height,layer,obj_barrel);
			
			with(obj_entity)
				y += -_y_move/obj_control.depth_scaling;
				
			y += -_y_move/3;
				
			obj_control.level_depth += 1
			layer_y(layer_get_id("Background"),-obj_control.level_depth/obj_control.depth_scaling);
		}
		
		part_particles_create(obj_control.particle_sword_trail_system,x,bbox_bottom,obj_control.particle_sword_trail_part,1);
		reset_animation();
		
		if(_space and dodge_cooldown <= 0)
		{
			dodge_dir = _dir;
			dodge_cooldown = dodge_cooldown_max;	
			trigger_animation((2*_move_speed)/2,dodge,spr_player);
		}
}

// summon sword
if(sword_cooldown <= 0 and _mouse_left  and not animation_callback)
{
	//summon_sword();
	sword_casts_left = sword_casts;
	trigger_animation(sword_animation_delay,summon_sword,spr_player_casting);
}

// special
if(special_cooldown <= 0 and _mouse_right and not animation_callback)
{
	
	trigger_animation(special_delay,special_attack,spr_player_casting);
	if(obj_control.speech_bubble_text == "" )
		obj_control.set_text_bubble(choose("Depth palm!","Deep Fisting!","Hand from the depths!"))
}

// sword_array
if(sword_array_cooldown <= 0 and _e_ability and not animation_callback)
{
	trigger_animation(sword_array_delay,sword_array,spr_player_casting);
	if(obj_control.speech_bubble_text == "" )
		obj_control.set_text_bubble(choose("Deep retribution!","Let the swords run deep through your skin","Deep diving swords!"))
}

// push back
if(push_back_cooldown <= 0 and _q_ability and not animation_callback)
{
	
	trigger_animation(push_back_delay,push_back,spr_player_casting);
	if(obj_control.speech_bubble_text == "" )
		obj_control.set_text_bubble(choose("Back to the depths!","Deepen the distance between us","Deep friend zoning"))
}

// timers
if(sword_cooldown > 0)
	sword_cooldown -= 1/_cool_speed;

if(animation_delay > 0)
	animation_delay -= 1;
	
if(dodge_cooldown > 0)
	dodge_cooldown -= 1/_cool_speed;
	
if(special_cooldown > 0)
	special_cooldown -= 1/_cool_speed;
	
if(sword_array_cooldown > 0)
	sword_array_cooldown -= 1/_cool_speed;
	
if(push_back_cooldown > 0)
	push_back_cooldown -= 1/_cool_speed;
	
if(animation_delay <= 0 and animation_callback)
	method_call(animation_callback,[]);
	
	

if(x < 16)
	x = 16;
if(x > room_width-16)
	x = room_width-16;
if(y < 16)
	y = 16;
if(y > room_height-16)
	y = room_height-16;
