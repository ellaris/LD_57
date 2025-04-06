/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var _s = instance_place(x,y,obj_sword);
if( _s or instance_place(x,y,obj_aftershock))
{
	if(_s)
		_s.impact();
	instance_destroy();
}

if(y < 0)
	instance_destroy();