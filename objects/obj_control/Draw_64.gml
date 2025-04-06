/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


draw_set_color(c_black);
draw_text_ext(0,16,string("Depth of Hell: {0}",level_depth),-1,100);


var _yy = 48+16
draw_set_alpha(0.5);
var _box_size = 32;
var _margin = 8


draw_sprite_ext(spr_sword,0,_margin+_box_size/2,_yy+_box_size/2,2,2,0,c_white,1);
draw_rectangle(_margin,_yy+_box_size-_box_size*obj_expert.sword_cooldown/obj_expert.sword_cooldown_max,_margin+_box_size,_yy+_box_size,false)
draw_set_alpha(1)
draw_rectangle(_margin,_yy,_margin+_box_size,_yy+_box_size,true)
draw_text(_margin*2+_box_size,_yy,"LMB")

_yy += 32;


draw_rectangle(_margin,_yy,_margin+_box_size,_yy+_box_size,true)
draw_sprite_ext(spr_player,0,_margin+_box_size/2,_yy+_box_size/2,1,1,0,c_white,1);
draw_set_alpha(0.5);
draw_rectangle(8,_yy+_box_size-_box_size*obj_expert.dodge_cooldown/obj_expert.dodge_cooldown_max,_margin+_box_size,_yy+_box_size,false)
draw_set_alpha(1)
draw_text(_margin*2+_box_size,_yy,"SPACE")

_yy += 32;


draw_rectangle(_margin,_yy,_margin+_box_size,_yy+_box_size,true)
draw_sprite_ext(spr_depth_palm,0,_margin+_box_size/2,_yy+_box_size/2,0.5,0.5,0,c_white,1);
draw_set_alpha(0.5);
draw_rectangle(8,_yy+_box_size-_box_size*obj_expert.special_cooldown/obj_expert.special_cooldown_max,_margin+_box_size,_yy+_box_size,false)
draw_set_alpha(1)
draw_text(_margin*2+_box_size,_yy,"RMB")

_yy += 32;


draw_rectangle(_margin,_yy,_margin+_box_size,_yy+_box_size,true)
draw_circle(_margin+_box_size/2,_yy+_box_size/2,_box_size/3,true);
draw_set_alpha(0.5);
draw_rectangle(8,_yy+_box_size-_box_size*obj_expert.push_back_cooldown/obj_expert.push_back_cooldown_max,_margin+_box_size,_yy+_box_size,false)
draw_set_alpha(1)
draw_text(_margin*2+_box_size,_yy,"Q")

_yy += 32;



draw_sprite_ext(spr_sword,0,_margin+_box_size/2-7,_yy+_box_size/2,2,2,270,c_white,1);
draw_sprite_ext(spr_sword,0,_margin+_box_size/2,_yy+_box_size/2,2,2,270,c_white,1);
draw_sprite_ext(spr_sword,0,_margin+_box_size/2+7,_yy+_box_size/2,2,2,270,c_white,1);
draw_set_alpha(0.5);
draw_rectangle(8,_yy+_box_size-_box_size*obj_expert.sword_array_cooldown/obj_expert.sword_array_cooldown_max,_margin+_box_size,_yy+_box_size,false)
draw_set_alpha(1)
draw_rectangle(_margin,_yy,_margin+_box_size,_yy+_box_size,true)
draw_text(_margin*2+_box_size,_yy,"E")

_yy += 32+16;
draw_rectangle(_margin,_yy,_margin+_box_size,_yy+_box_size,true)

var _hx =_margin+_box_size/2;
var _hy = _yy+_box_size/2;

draw_text(_margin*2+_box_size,_yy,"inDepth\nHealth")



for(var i = 0; i < array_length(obj_expert.hp_bars);i++)
{
	var _c = c_yellow;
	var _hp = obj_expert.hp_bars[i];
	var _hp_max = obj_expert.hp_bars_max[i]
	if(_hp < _hp_max)
	{
		if(_hp < _hp_max/2)
			_c = c_red;
		if(_hp <= 0)
			_c = c_black;
		draw_sprite_ext(spr_health,1+i,_hx,_hy,1,1,0,_c,1)
	}
}

draw_sprite(spr_health,0,_hx,_hy);


//if(obj_expert.hp_torso < obj_expert.hp_head_max)
//{
//	if(obj_expert.hp_head < obj_expert.hp_head_max/2)
//	_c = c_red;
//	draw_sprite_ext(spr_health,1,_hx,_hy,1,1,0,_c,1)
//}
//if(obj_expert.hp_head < obj_expert.hp_head_max)
//{
//	if(obj_expert.hp_head < obj_expert.hp_head_max/2)
//	_c = c_red;
//	draw_sprite_ext(spr_health,1,_hx,_hy,1,1,0,_c,1)
//}
//if(obj_expert.hp_head < obj_expert.hp_head_max)
//{
//	if(obj_expert.hp_head < obj_expert.hp_head_max/2)
//	_c = c_red;
//	draw_sprite_ext(spr_health,1,_hx,_hy,1,1,0,_c,1)
//}
//if(obj_expert.hp_head < obj_expert.hp_head_max)
//{
//	if(obj_expert.hp_head < obj_expert.hp_head_max/2)
//	_c = c_red;
//	draw_sprite_ext(spr_health,1,_hx,_hy,1,1,0,_c,1)
//}
//if(obj_expert.hp_head < obj_expert.hp_head_max)
//{
//	if(obj_expert.hp_head < obj_expert.hp_head_max/2)
//	_c = c_red;
//	draw_sprite_ext(spr_health,1,_hx,_hy,1,1,0,_c,1)
//}

if(string_length(speech_bubble_text))
{
	var _p = obj_expert;
	var _xratio = view_get_wport(view_current)/room_width
	var _yratio = view_get_hport(view_current)/room_height
	var _xsacle = 2.5;
	var _text_xoffset = 0;
	if(_p.x > room_width/2)
	{
		//_xratio *= -1;
		_xsacle *= -1;
		_text_xoffset = 128;
	}
		
	
	draw_sprite_ext(spr_text_bubble,0,(_p.x)*_xratio+8,(_p.y)*_yratio-16,_xsacle,2.5,0,c_white,1);
	
	draw_set_color(c_black);
	draw_text_ext((_p.x)*_xratio+8+14+(8+6)*sign(_xsacle)-_text_xoffset,(_p.y)*_yratio-130-16,speech_bubble_text,-1,100);
	//draw_set_color(c_white);
	
}
