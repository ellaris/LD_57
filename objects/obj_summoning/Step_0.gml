/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(not instance_number(obj_npc) or not summon)
life -= 1;

if(instance_number(obj_npc))
{
	if(audio_is_playing(sound))
		audio_pause_sound(sound)
	visible = false;
}
else
{
	visible = true;
	create_particle();
	if(not audio_is_playing(sound))
		audio_resume_sound(sound)
}


if(life <= 0)
	instance_destroy();
