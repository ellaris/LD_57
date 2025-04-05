/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


image_angle = direction

part_particles_burst(obj_control.particle_sword_system, x, y, obj_control.particle_sword_part);

var _x = lengthdir_x(speed/2,direction)
var _y = lengthdir_y(speed/2,direction)
part_particles_burst(obj_control.particle_sword_system, x-_x, y-_y, obj_control.particle_sword_part);

life += 1;
if(life > max_life_seconds*obj_control.game_speed)
	instance_destroy();
	
	
// move towards target
var _dir = point_direction(x,y,target_x,target_y);
direction += clamp(angle_difference(_dir,direction),-turn_speed,turn_speed);