/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

var _mouse_left = mouse_check_button(mb_left);
var _mouse_right = mouse_check_button(mb_right);

// movement
if(_left or _right or _up or _down)
{
		var _dir = point_direction(0,0,_right-_left,_down-_up);
		x += lengthdir_x(move_speed,_dir);
		y += lengthdir_y(move_speed,_dir);
}

// summon sword
if(sword_cooldown <= 0 and _mouse_left)
{
	summon_sword();
}


// timers
if(sword_cooldown > 0)
	sword_cooldown -= 1;
