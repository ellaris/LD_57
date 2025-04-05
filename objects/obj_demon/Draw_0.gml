/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod




draw_self();

//draw shadow
draw_sprite_ext(sprite_index,image_index,x,bbox_bottom,1,-0.2,image_angle,c_black,(image_alpha+0.5)/2)


draw_set_color(c_red);
draw_rectangle(bbox_left,bbox_top,bbox_left+(bbox_right-bbox_left)*(hp/max_hp),bbox_top-8,false)

draw_set_color(c_white);