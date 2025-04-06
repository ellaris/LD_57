/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();

max_hp = 1500;
hp = max_hp;

move_speed = 2;

attack_cooldown_max = obj_control.game_speed*1.0;

default_sprite = spr_dog_real;

roll_count_max = 5;
roll_count = roll_count_max;
roll_cooldown_max = obj_control.game_speed*1.5;
roll_cooldown = 0;
roll_delay = 20;

dog_roll = function(){
	
	
	if(roll_count > 0)
	{
		roll_count -= 1;
		speed = move_speed*1.8;
		var _e = instance_nearest(x,y,obj_dog_eyeball);
		var _p = instance_nearest(x,y,obj_player);
		
		var _choice = [];
		if(_e)
			array_push(_choice,point_direction(x,y,_e.x,_e.y));
		array_push(_choice,point_direction(x,y,_p.x,_p.y));
		array_push(_choice,point_direction(_p.x,_p.y,x,y));
		array_push(_choice,point_direction(x,y,_p.x+irandom(64)-32,_p.y+irandom(64)-32));
		array_push(_choice,point_direction(x,y,room_width/2,room_height/2));
		array_push(_choice,point_direction(room_width/2,room_height/2,x,y));
		
		direction = array_shuffle(_choice)[0];
		trigger_animation(15,dog_roll,default_sprite);
	}
	else
	{
		roll_cooldown = roll_cooldown_max;
		roll_count = roll_count_max;
		trigger_animation(30,reset_animation,default_sprite);
	}
}

left_eyeball = true;
right_eyeball = true;

eyeball_cooldown_max = obj_control.game_speed*1.5;
eyeball_cooldown = 0;
eyeball_delay = 30;

eyeball_shoot = function(){
	
	eyeball_cooldown = eyeball_cooldown_max;
	
	if(left_eyeball or right_eyeball)
	{
		var _eyeball = instance_create_layer(x,y,layer,obj_dog_eyeball);
		var _p = instance_nearest(x,y,obj_player)
		_eyeball.direction = point_direction(x,y,_p.x,_p.y);
		
		if(left_eyeball)
		{
			left_eyeball = false;
			_eyeball.x -= 5;
		}
		else
		{
			right_eyeball = false;
			_eyeball.x += 5;
			
		}
	}
	
	if(left_eyeball or right_eyeball)
		trigger_animation(10,eyeball_shoot,default_sprite);
	else
		trigger_animation(10,reset_animation,default_sprite);
}

deep_pull_cooldown_max = obj_control.game_speed*2.5;
deep_pull_cooldown = 0;
deep_pull_delay = 45;

deep_pull_count_max = 6;
deep_pull_count = 0;

deep_pull = function(){
	deep_pull_cooldown = deep_pull_cooldown_max;
	deep_pull_count += 1;
	var _p = instance_nearest(x,y,obj_player);
	instance_create_layer(_p.x,_p.y,layer,obj_dog_deep_pull);
	
	if(deep_pull_count < deep_pull_count_max)
		trigger_animation(25,deep_pull,default_sprite);
	else
	{
		
		deep_pull_count = 0;
		trigger_animation(10,reset_animation,default_sprite);
	}
	
}