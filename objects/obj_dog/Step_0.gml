/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(instance_exists(obj_npc))
	image_speed = 0
else 
if(image_speed == 0)
	image_speed = 1;

if(sprite_index == spr_dog_transformation)
{
	//show_debug_message("Waiting");
	exit;
}

// Inherit the parent event
event_inherited();

if(roll_count == roll_count_max)
{
	if(not animation_callback)
	{
		var _p = instance_nearest(x,y,obj_player)
		var _e = instance_nearest(x,y,obj_dog_eyeball)
	
		if(_e and _e.life > obj_control.game_speed*4)
		{
			var _pd = point_distance(x,y,_p.x,_p.y);
			var _ed = point_distance(x,y,_e.x,_e.y);
			if(_ed < _pd)
				_p = _e;
		}
		if(_e and _e.life > obj_control.game_speed*15)
			_p = _e;
		
		speed = move_speed;
		direction = point_direction(x,y,_p.x,_p.y);
	}
	else 
		speed = 0;
}

if(eyeball_cooldown > 0)
	eyeball_cooldown -= 1;
	
if(roll_cooldown > 0)
	roll_cooldown -= 1;

if(deep_pull_cooldown > 0)
	deep_pull_cooldown -= 1;
	

if(attack_cooldown == 0 and not animation_callback)
{
	var _c = choose(0,1,2,3);
	
	var _action_array = [[1,reset_animation,default_sprite,0],
	[eyeball_delay,eyeball_shoot,spr_dog_real_shoot,eyeball_cooldown],
	[deep_pull_delay,deep_pull,spr_dog_real_pull,deep_pull_cooldown],
	[roll_delay,dog_roll,default_sprite,roll_cooldown]
	]
	
	var _cc = _action_array[_c]
	
	while(_cc[3] != 0)
	{
		_c = choose(0,1,2,3);
		_cc = _action_array[_c];
	}
	
	trigger_animation(_cc[0],_cc[1],_cc[2]);
	
	attack_cooldown = attack_cooldown_max;
}
	
//if(eyeball_cooldown <= 0 and (left_eyeball or right_eyeball) and not animation_callback)
//{
//	trigger_animation(eyeball_delay,eyeball_shoot,default_sprite);	
//}

var _eye  = instance_place(x,y,obj_dog_eyeball);

if(_eye and _eye.life > obj_control.game_speed*5)
{
	instance_destroy(_eye);
	if(left_eyeball)
			right_eyeball = true;
		else
			left_eyeball = true;	
}