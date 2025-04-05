/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

var _space = keyboard_check(vk_space);

var _mouse_left = mouse_check_button(mb_left);
var _mouse_right = mouse_check_button(mb_right);

// movement
if((_left or _right or _up or _down) and animation_callback != dodge)
{
		var _dir = point_direction(0,0,_right-_left,_down-_up);
		x += lengthdir_x(move_speed,_dir);
		y += lengthdir_y(move_speed,_dir);
		part_particles_create(obj_control.particle_sword_trail_system,x,bbox_bottom,obj_control.particle_sword_trail_part,1);
		reset_animation();
		
		if(_space and dodge_cooldown == 0)
		{
			dodge_dir = _dir;
			dodge_cooldown = dodge_cooldown_max;	
			trigger_animation(2,dodge,spr_player);
		}
}

// summon sword
if(sword_cooldown <= 0 and _mouse_left  and not animation_callback)
{
	//summon_sword();
	
	trigger_animation(sword_animation_delay,summon_sword,spr_player_casting);
}

// special
if(special_cooldown <= 0 and _mouse_right and not animation_callback)
{
	
	trigger_animation(special_delay,special_attack,spr_player_casting);
	obj_control.set_text_bubble(choose("Depth palm!","Deep Fisting!","Hand from the depths!"))
}


// timers
if(sword_cooldown > 0)
	sword_cooldown -= 1;

if(animation_delay > 0)
	animation_delay -= 1;
	
if(dodge_cooldown > 0)
	dodge_cooldown -= 1;
	
if(special_cooldown > 0)
	special_cooldown -= 1;
	
if(animation_delay == 0 and animation_callback)
	method_call(animation_callback,[]);