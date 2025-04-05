/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

draw_self();

//draw shadow

draw_sprite_ext(sprite_index,image_index,x,bbox_bottom+8,1,-0.2,image_angle,c_black,(image_alpha+0.5)/2);

if(animation_callback == push_back)
{
	draw_circle(x,y,push_back_damage_range*(1-animation_delay/push_back_delay),true);
	draw_circle(x,y,push_back_push_range*(1-animation_delay/push_back_delay),true);
}

