/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


image_angle = direction

//part_particles_burst(obj_control.particle_sword_trail_system, x, y, obj_control.particle_sword_trail_part);
part_particles_create(obj_control.particle_sword_trail_system,x,y, obj_control.particle_sword_trail_part,1)
var _x = lengthdir_x(speed/2,direction)
var _y = lengthdir_y(speed/2,direction)
//part_particles_burst(obj_control.particle_sword_trail_system, x-_x, y-_y, obj_control.particle_sword_trail_part);
part_particles_create(obj_control.particle_sword_trail_system,x-_x,y-_y, obj_control.particle_sword_trail_part,1)
life += 1;
if(life > max_life_seconds*obj_control.game_speed or hits = 0)
	instance_destroy();
	
if(hit_cooldown > 0)
	hit_cooldown -= 1;
	
	
// move towards target
var _dir = point_direction(x,y,target_x,target_y);
direction += clamp(angle_difference(_dir,direction),-turn_speed,turn_speed);
direction += sin(life/10)*turn_speed;

var _demon = instance_position(x,y,obj_demon);
if(_demon and hit_cooldown <= 0)
{
	_demon.take_damage(impact());
}