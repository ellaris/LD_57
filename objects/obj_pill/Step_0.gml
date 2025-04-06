/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod




if(not effective)
{
	if(y < 0)
		instance_destroy();
		
	if(instance_position(x,y,obj_expert))
	{
		effective = true;
		var _v = variable_instance_get(obj_expert,stat);
		variable_instance_set( obj_expert,stat,_v+stat_value);
		visible = false;
	}
}
else
	duration -= 1;
	
if(duration <= 0)
{
	var _v = variable_instance_get(obj_expert,stat);
	variable_instance_set( obj_expert,stat,_v-stat_value);
	instance_destroy();
}