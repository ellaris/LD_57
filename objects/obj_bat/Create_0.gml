/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


event_inherited();

move_speed = 2;

target_x = x;
target_y = y;

distance_check = 50;
last_distance = 0;

max_hp = 60;
hp = max_hp;

shadow_y_offset = 20;

attack = function(){
	//trigget_animation(10,wait,spr_swiper_swiping);
	var _p = instance_nearest(x,y,obj_player)
	if(_p and point_distance(x,bbox_bottom,_p.x,_p.bbox_top) < 16)
	{
		_p.take_damage(8);
	}
	trigger_animation(5,reset_animation,default_sprite);
}