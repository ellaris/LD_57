/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


audio_play_sound_at(snd_swish,obj_expert.x-x,0,y,room_width/4,room_width/2,0.75,false,6,0.5);

target_x = x;
target_y = y;

strength = 10;
hits = 3;
speed = 6;
turn_speed = 11;
life = 0;
max_life_seconds = 4.0;

hit_cooldown = 0;
hit_cooldown_max = obj_control.game_speed*0.3;

set_target = function(_x,_y){
	target_x = _x;
	target_y = _y;
}

impact = function(){
	audio_play_sound(snd_sword_hit,1,false,0.5);
	
	hits -= 1;
	speed -= 1;
	turn_speed -= 2;
	strength -= 2;
	hit_cooldown = hit_cooldown_max;
	part_particles_create(obj_control.particle_sword_hit_system, x, y, obj_control.particle_sword_hit_part,10);
	
	return(strength)
}