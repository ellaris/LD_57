/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

with(obj_demon)
	if(point_in_rectangle(x,y,other.bbox_left,other.bbox_top,other.bbox_right,other.bbox_bottom))
		take_damage(10);

instance_destroy();

