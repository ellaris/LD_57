/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(arrival > 0)
	arrival -= 1;
	
if(arrival <= 0)
{
	
	with(obj_demon)
	if(point_distance(x,y,other.x+other.offset_x,other.y+other.offset_y) <= 38)
	{
		take_damage(15);
		trigger_animation(60,stun,default_sprite);
	}
	
	instance_create_layer(x+other.offset_x,y+other.offset_y,layer,obj_aftershock);
	
	hits -= 1;
	arrival = 10+irandom(10);
	arrival_angle = irandom(180-90);
	
	offset_x = 100-irandom(200);
	offset_y = 50-irandom(100);
	
	
	
}
if(hits == 0)
	instance_destroy();
