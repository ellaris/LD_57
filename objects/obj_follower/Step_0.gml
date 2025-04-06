/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var _dis = point_distance(x,y,obj_player.x,obj_player.y);
if(_dis > range_to_player)
{
	speed = move_speed;
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	part_particles_create(obj_control.particle_sword_trail_system,x,bbox_bottom,obj_control.particle_sword_trail_part,1);
}
else
	speed = 0;
	
if(sword_cooldown > 0)
	sword_cooldown -= 1;
	
if(sword_cooldown <= 0)
{
	summon_sword();
	
}

