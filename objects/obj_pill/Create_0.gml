/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();


duration = obj_control.game_speed*15;

var _array = [
"move_speed",1,
"sword_hits", 2,
"sword_speed", 3,
"sword_casts", 1,
"dodge_count_max", 3,
"special_flurry_hits", 2,
"sword_array_gap", -8
]

var _c = choose(0,1,2,3,4,5,6);

stat = _array[_c*2];
stat_value = _array[_c*2+1]
effective = false;