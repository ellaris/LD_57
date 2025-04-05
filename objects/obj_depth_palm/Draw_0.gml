/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


draw_set_alpha(0.5);
draw_set_color(c_blue);

draw_circle(x,y,32,true);


draw_set_alpha(1);
draw_set_color(c_white);

var _dir = 180+45+arrival_angle;

var _c = c_blue;
if(arrival <= 5)
	_c = c_white;
	
if(arrival*5 < 128)
draw_sprite_ext(spr_depth_palm,0,x+offset_x-lengthdir_x(arrival*5,_dir),y+offset_y+lengthdir_y(arrival*5,_dir),1,1,360-_dir,_c,1);
