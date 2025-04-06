/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



if( last_enemy_depth < level_depth-enemy_depth_interval and not instance_exists(obj_dog))
{
	repeat log10(level_depth)
	{
		var _summon = instance_create_layer(irandom(room_width),room_height-32,layer,obj_summoning);
		_summon.turn_to = choose(obj_swiper,obj_chainer,obj_bat);
	}
	
	last_enemy_depth = level_depth;
}

//if(level_depth == 5*depth_scaling and not instance_number(obj_npc_child))
//{
//	instance_create_layer(room_width/2+64-irandom(128),room_height-32,layer,obj_npc);
//	level_depth += 1;
//}

if(level_depth == 300*depth_scaling and not instance_number(obj_npc_child))
{
	instance_create_layer(room_width/2+64-irandom(128),room_height-32,layer,obj_npc_child);
	level_depth += 1;
}
	
if(level_depth == 720*depth_scaling and not instance_number(obj_npc_dog))
{
	instance_create_layer(room_width/2+64-irandom(128),room_height-32,layer,obj_npc_dog);
	level_depth += 1;
}

if(instance_exists(obj_dog))
{
	
	var _num = instance_number(obj_demon) + instance_number(obj_summoning);
	if(_num < 1+2)
	{
		var _summon = instance_create_layer(irandom(room_width),room_height-32,layer,obj_summoning);
		_summon.turn_to = choose(obj_swiper,obj_chainer,obj_bat);
	}
}

if(level_depth > 720*depth_scaling and instance_number(obj_demon) == 0 and not game_over)
{
	game_over = true;
	set_text_bubble("This is deep enough for LD57 thanks for playing");
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
	
if(speech_bubble_cooldown == 0 and not speech_bubble_forced)
{
	//speech_bubble_cooldown = speech_bubble_cooldown_max;
	//speech_bubble_text = ;
	set_text_bubble(choose("How deep can I go?","Wow, the Depths of hell","Don't get lost in the depth of it's eyes"))
}