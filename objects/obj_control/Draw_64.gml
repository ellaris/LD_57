/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

draw_text_ext(0,16,string("Depth of Hell: {0}",level_depth),-1,100);


var _yy = 48+16
draw_set_alpha(0.5);
var _box_size = 32;
var _margin = 8

draw_rectangle(_margin,_yy+_box_size-_box_size*obj_expert.sword_cooldown/obj_expert.sword_cooldown_max,_margin+_box_size,_yy+_box_size,false)
draw_set_alpha(1)
draw_rectangle(_margin,_yy,_margin+_box_size,_yy+_box_size,true)
draw_sprite_ext(spr_sword,0,_margin+_box_size/2,_yy+_box_size/2,2,2,0,c_white,1);

_yy += 32;

draw_set_alpha(0.5);
draw_rectangle(8,_yy+_box_size-_box_size*obj_expert.dodge_cooldown/obj_expert.dodge_cooldown_max,_margin+_box_size,_yy+_box_size,false)
draw_set_alpha(1)
draw_rectangle(_margin,_yy,_margin+_box_size,_yy+_box_size,true)
draw_sprite_ext(spr_player,0,_margin+_box_size/2,_yy+_box_size/2,1,1,0,c_white,1);

_yy += 32;

draw_set_alpha(0.5);
draw_rectangle(8,_yy+_box_size-_box_size*obj_expert.special_cooldown/obj_expert.special_cooldown_max,_margin+_box_size,_yy+_box_size,false)
draw_set_alpha(1)
draw_rectangle(_margin,_yy,_margin+_box_size,_yy+_box_size,true)
draw_sprite_ext(spr_depth_palm,0,_margin+_box_size/2,_yy+_box_size/2,0.5,0.5,0,c_white,1);


if(string_length(speech_bubble_text))
{
	var _p = obj_expert;
	var _xratio = view_get_wport(view_current)/room_width
	var _yratio = view_get_hport(view_current)/room_height
	draw_sprite_ext(spr_text_bubble,0,(_p.x)*_xratio+8,(_p.y)*_yratio-16,2.5,2.5,0,c_white,1);
	
	draw_set_color(c_black);
	draw_text_ext((_p.x)*_xratio+8+14+8+6,(_p.y)*_yratio-130-16,speech_bubble_text,-1,100);
	draw_set_color(c_white);
	
	with(obj_expert)
	{
		
	}
}
