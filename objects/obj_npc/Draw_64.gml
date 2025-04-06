/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


draw_set_color(c_black);
if(string_length(speech_bubble_text))
{
	var _p = obj_npc;
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

if(choice)
{
	for(var i = 0; i < array_length(choices); i++)
	{
		var _text = choice_list[i*2];
		var _method = choice_list[i*2+1];
		var _val = choices[i];
		
		if(_val >= 100)
		{
			method_call(_method,[]);
			instance_destroy();
		}
		if(obj_expert.x > room_width/3*(i*2) and obj_expert.x < room_width/3*(i*2+1))
			choices[i] += 33/obj_control.game_speed*3;
		else
			choices[i] = 0;
		draw_set_alpha(0.5);
		draw_rectangle(view_wport/3*(i*2),0,view_wport/3*(i*2)+_val/100*(view_wport/3),view_hport,false)
		draw_set_alpha(1)
		draw_line(view_wport/3*(i*2+1),0,view_wport/3*(i*2+1),view_hport);
		draw_text_ext(view_wport/3*(i*2+1)-100-view_wport/6,view_hport/2,_text,-1,200);
	}
}

