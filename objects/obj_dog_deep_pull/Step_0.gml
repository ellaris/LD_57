/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

life += 1;

part_type_direction(obj_control.particle_summon_part,90,90,0,0);
part_particles_create(obj_control.particle_sword_trail_system,x+irandom(sprite_width/2)-sprite_width/4,y,obj_control.particle_summon_part,1)

//if(life > obj_control.game_speed*0.5)
//	instance_destroy();

var _p = instance_place(x,y,obj_player);
if(not player_hit and _p and image_index > image_number/2)
{
	player_hit = true;
	_p.take_damage(8);
}
