/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


var _num = instance_number(obj_demon) + instance_number(obj_summoning);

if( _num < floor(sqrt(level_depth*5)))
{
	var _summon = instance_create_layer(irandom(room_width),room_height-32,layer,obj_summoning);
	_summon.turn_to = choose(obj_swiper,obj_chainer,obj_bat);
}


//with(obj_sword)
//{
//	part_particles_create(other.particle_sword_trail_system,x,y, other.particle_sword_trail_part,1)
//	var _x = lengthdir_x(speed/2,direction)
//	var _y = lengthdir_y(speed/2,direction)
//	part_particles_create(other.particle_sword_trail_system,x-_x,y-_y, other.particle_sword_trail_part,1)	
//}
if(speech_bubble_cooldown > 0)
	speech_bubble_cooldown -= 1;
	
if(string_length(speech_bubble_text))
	speech_bubble_timer += 1;
else
	speech_bubble_timer = 0;
	
if(speech_bubble_timer >= game_speed*3.5)
	speech_bubble_text = "";
	
if(speech_bubble_cooldown == 0)
{
	//speech_bubble_cooldown = speech_bubble_cooldown_max;
	//speech_bubble_text = ;
	set_text_bubble(choose("How deep can I go?","Wow, the Depths of hell","Don't get lost in the depth of it's eyes"))
}