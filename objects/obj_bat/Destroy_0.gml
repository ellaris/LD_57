/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();
exit;

obj_control.set_text_bubble(choose("Back to the Depths with you!","That attack went in deep"))

var _summon = instance_create_layer(x,y,layer,obj_summoning);
_summon.summon = false;
_summon.turn_to = object_index;
//obj_control.level_depth += 1;