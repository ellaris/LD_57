/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


particle_sword_trail_system = part_system_create(ps_sword_trail);
particle_sword_trail_part =  particle_get_info(particle_sword_trail_system).emitters[0].parttype;

//particle_sword_hit_system = part_system_create(ps_sword_hit);
//particle_sword_hit_part =  particle_get_info(particle_sword_hit_system).emitters[0].parttype;

game_speed = game_get_speed(gamespeed_fps);