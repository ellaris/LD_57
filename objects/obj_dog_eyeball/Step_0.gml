/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(x > room_width or x < 0 )
{
	hspeed = -hspeed;
}

if(y < 0 or y > room_height)
{
	vspeed = -vspeed;
}

image_angle += hspeed+vspeed;
//image_speed = speed/2;

life += 1;
if(not instance_exists(obj_dog))
	instance_destroy();

if((life mod (obj_control.game_speed*15)) == 0)
{
	if(speed == 0)
		speed = 1;
	direction = point_direction(x,y,obj_dog.x,obj_dog.y);
}
