/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

// particles
level_depth = 1;

particle_sword_trail_system = part_system_create();

particle_sword_trail_part = part_type_create();
part_type_color3(particle_sword_trail_part,#9edae6,c_white,c_white);
part_type_life(particle_sword_trail_part,30,60);
part_type_size(particle_sword_trail_part,1,1,-0.01,0);

particle_sword_hit_system = part_system_create();

particle_sword_hit_part = part_type_create();
part_type_shape(particle_sword_hit_part,pt_shape_line);
part_type_color3(particle_sword_hit_part,c_white,#9c9c9c,#262626);
part_type_life(particle_sword_hit_part,30,15);
part_type_size(particle_sword_hit_part,0.1,0.25,-0.01,0);
part_type_speed(particle_sword_hit_part,4,5,-0.1,0);
part_type_direction(particle_sword_hit_part,0,360,0,0);
part_type_orientation(particle_sword_hit_part,0,0,0,0,true);

particle_blood_drip_part = part_type_create();
part_type_color2(particle_blood_drip_part,c_red,c_maroon);
part_type_life(particle_blood_drip_part,30,15);
part_type_speed(particle_blood_drip_part,1,2,-0.01,0);
part_type_direction(particle_blood_drip_part,180+45,360-45,0,0);
part_type_size(particle_blood_drip_part,2,3,-0.01,0.02);

//particle_sword_trail_system = part_system_create(ps_sword_trail);
//particle_sword_trail_emitter = particle_get_info(particle_sword_trail_system).emitters[0]
//particle_sword_trail_part =  particle_sword_trail_emitter.parttype;

//particle_sword_hit_system = part_system_create(ps_sword_hit);
//particle_sword_hit_emitter = particle_get_info(particle_sword_hit_system).emitters[0]
//particle_sword_hit_part =  particle_sword_hit_emitter.parttype;


//part_system_automatic_draw()
//part_emitter_stream(particle_sword_hit_system, particle_sword_hit_emitter, particle_sword_hit_part, 0);
//part_emitter_stream(particle_sword_trail_system, particle_sword_trail_emitter, particle_sword_trail_part, 0);
//part_emitter_enable(particle_sword_trail_system,particle_sword_trail_emitter,false);
//part_emitter_enable(particle_sword_hit_system,particle_sword_hit_emitter,false);
game_speed = game_get_speed(gamespeed_fps);


speech_bubble_timer = 0;
speech_bubble_text = "";
speech_bubble_cooldown = 0
speech_bubble_cooldown_max = game_speed*20;

set_text_bubble = function(_text){
	speech_bubble_text = _text;
	speech_bubble_cooldown = speech_bubble_cooldown_max;
	speech_bubble_timer = 0
}