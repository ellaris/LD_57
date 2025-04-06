/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



//turn_to = obj_swiper;
summon = true;
life_max = obj_control.game_speed*1;
life = life_max;

create_particle = function(){
	var _yoffset = 0;
	if(summon)
		part_type_direction(obj_control.particle_summon_part,90,90,0,0);
	else
	{
		part_type_direction(obj_control.particle_summon_part,270,270,0,0);
		_yoffset = 16;
	}
	part_particles_create(obj_control.particle_sword_trail_system,x+irandom(sprite_width/2)-sprite_width/4,y-_yoffset,obj_control.particle_summon_part,1)
}
