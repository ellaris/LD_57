/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(not instance_number(obj_npc) or not summon)
life -= 1;

if(instance_number(obj_npc))
	visible = false;
else
{
	visible = true;
	create_particle();
}


if(life <= 0)
	instance_destroy();
