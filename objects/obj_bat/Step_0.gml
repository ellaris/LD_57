/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

var _t_dir = point_distance(x,y,target_x,target_y) <= move_speed*2;
var _p = instance_nearest(x,y,obj_player)
var _dis = point_distance(x,y,_p.x,_p.bbox_top);

if(_dis < 16 and attack_cooldown == 0 and (not animation_callback))
{
	trigger_animation(20,attack,spr_bat_attack);
	attack_cooldown = attack_cooldown_max;
}

if(_t_dir or last_distance+distance_check < _dis)
{
	
	var _dir = point_direction(_p.x,_p.bbox_top,x,y);
	var _n = ((_dis) div distance_check);
	var _n_set = (room_height div distance_check)-_n
	//_dir += _n_set*10-irandom(_n_set*20);
	_dir += sign(angle_difference(90,_dir))*5;
	
	target_x = _p.x+lengthdir_x(_n*distance_check,_dir);
	target_y = _p.bbox_top+lengthdir_y(_n*distance_check,_dir);
	last_distance = _dis;
}

if(not animation_callback and _dis > 16)
{
	//if(_p.y < y)
	//{
	//	y -= move_speed*(1+hp/max_hp)/2;
	//	//x -= sign(_p.x-x)*move_speed*(1+hp/max_hp)/2;
	//}
	//else
	{
	direction = point_direction(x,y,target_x,target_y);
	speed = move_speed*hp/max_hp;
	}
}
else
	speed = 0;