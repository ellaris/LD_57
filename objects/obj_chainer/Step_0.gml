/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

var _t_dir = point_distance(x,y,target_x,target_y) <= move_speed*2;
var _p = instance_nearest(x,y,obj_player)
var _dis = point_distance(x,y,_p.x,_p.y);

if(_dis < distance_check and attack_cooldown == 0 and (not animation_callback))
{
	audio_play_sound(snd_chainer_rearing,5,false,0.6);
	throw_chains = 1;
	trigger_animation(throw_chains_delay,rear,spr_chainer_rearing);
	attack_cooldown = attack_cooldown_max;
	var _dir = point_direction(x,y,_p.x,_p.y);
	target_x = x+lengthdir_x(distance_check*2,_dir);
	target_y = y+lengthdir_y(distance_check*2,_dir);
}

if((_t_dir or last_distance+distance_check < _dis) and (not animation_callback))
{
	
	var _dir = point_direction(_p.x,_p.y,x,y);
	var _n = (_dis div distance_check);
	var _n_set = (room_height div distance_check)-_n
	_dir += _n_set*10-irandom(_n_set*20);
	
	target_x = _p.x+lengthdir_x(_n*distance_check,_dir);
	target_y = _p.y+lengthdir_y(_n*distance_check,_dir);
	last_distance = _dis;
}

if(not animation_callback and _dis > 16)
{
	direction = point_direction(x,y,target_x,target_y);
	speed = move_speed*hp/max_hp;
}
else
	speed = 0;
	
if(throw_chains == 2)
{
	direction = point_direction(x,y,target_x,target_y);
	speed = 12;//point_distance(x,y,target_x,target_y)/(15-animation_delay);
	if(not hit_player and point_distance(x,bbox_bottom-12,_p.x,_p.y) < 16*2)
	{
		_p.take_damage(2);
		hit_player = true;
	}
}