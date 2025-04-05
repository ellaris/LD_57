/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


event_inherited();

move_speed = 3;

target_x = x;
target_y = y;

distance_check = 25;
last_distance = 0;

max_hp = 50;
hp = max_hp;

rear = function(){
	instance_create_layer(x,y,layer,obj_swipe);
	trigger_animation(15,attack,spr_swiper_swiping);
}

attack = function(){
	//trigget_animation(10,wait,spr_swiper_swiping);
	reset_animation();
}