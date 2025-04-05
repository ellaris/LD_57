/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


particle_sword_system = part_system_create(ps_sword_line);
particle_sword_part =  particle_get_info(ps_sword_line).emitters[0].parttype;

game_speed = game_get_speed(gamespeed_fps);