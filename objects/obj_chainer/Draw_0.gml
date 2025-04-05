/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(throw_chains)
{
	var _ratio = (throw_chains_delay-animation_delay)/throw_chains_delay;
	var _dis = point_distance(x,y,target_x,target_y);
	var _dir = point_direction(x,y,target_x,target_y);
	draw_sprite_ext(spr_chain,0,x-12,y,(_dis/16)*_ratio,1,_dir,c_white,1);
	draw_sprite_ext(spr_chain,0,x+12,y,(_dis/16)*_ratio,1,_dir,c_white,1);
}


// Inherit the parent event
event_inherited();

