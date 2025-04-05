/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


move_speed = 3;


sword_cooldown = 0
sword_cooldown_max = obj_control.game_speed*0.6;
sword_summon_side = 0;


summon_sword = function(){
	var _sword = instance_create_layer(x+30-60*sword_summon_side,y,layer,obj_sword);
	//_sword.direction = point_direction(x,y,mouse_x,mouse_y);
	_sword.direction = 180*sword_summon_side;
	_sword.set_target(mouse_x,mouse_y);
	
	sword_cooldown = sword_cooldown_max;
	sword_summon_side = not sword_summon_side;
}