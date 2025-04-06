/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


sword_cooldown = 0;
sword_cooldown_max = obj_control.game_speed*1.5;

sword_strength = obj_expert.sword_strength* 0.6;
sword_hits = 2;
sword_speed = 6;
sword_turn_speed = obj_expert.sword_turn_speed*0.7;

move_speed = 1.8;
range_to_player = 100;
sword_summon_side = 0;


summon_sword = function(){
	var _sword = instance_create_layer(x+10-20*sword_summon_side,y,layer,obj_sword);
	//_sword.direction = point_direction(x,y,mouse_x,mouse_y);
	var _enemy = instance_nearest(x,y,obj_demon);
	var _tx = x;
	var _ty = y;
	if(_enemy)
	{
		_tx = _enemy.x;
		_ty = _enemy.y;
	}
	
	_sword.direction = 180*sword_summon_side;
	_sword.set_target(_tx,_ty);
	_sword.hits = sword_hits;
	_sword.strength = sword_strength;
	_sword.speed = sword_speed;
	_sword.turn_speed = sword_turn_speed;
	
	sword_summon_side = not sword_summon_side;
	sword_cooldown = sword_cooldown_max;
	//trigger_animation(4,reset_animation,spr_player_casting);
}