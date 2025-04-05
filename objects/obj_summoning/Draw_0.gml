/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



draw_self();


var _spr = object_get_sprite(turn_to);
var _bbox_top = sprite_get_bbox_top(_spr)
var _bbox_bottom = sprite_get_bbox_bottom(_spr)

var _sh = _bbox_bottom-_bbox_top;
var _ratio = (summon ? life_max - life : life)/life_max;
var _height = _sh * _ratio;

draw_sprite_part(_spr,0,0,0,64,_ratio*64,x-64/2,y-_height-64/4);
