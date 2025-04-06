/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(speech_bubble_cooldown > 0)
	speech_bubble_cooldown -= 1;
	
if(string_length(speech_bubble_text))
	speech_bubble_timer += 1;
else
	speech_bubble_timer = 0;
	
if(speech_bubble_timer >= obj_control.game_speed*3.5)
	speech_bubble_text = "";
	
if(keyboard_check_pressed(vk_space))
	speech_bubble_cooldown = 0;

if(speech_bubble_cooldown == 0 and not instance_exists(obj_demon))
{
	
	if(forced_speech_index >= array_length(forced_speech_list))
	{
		obj_control.speech_bubble_forced = false;
		//instance_destroy();
		choice = true;
		speech_bubble_cooldown = -1;
	}
	else
	{
	speech_bubble_cooldown = speech_bubble_cooldown_max;
	var _text = forced_speech_list[forced_speech_index];
	var _obj = forced_speech_list[forced_speech_index+1];
	_obj.set_text_bubble(_text);
	forced_speech_index += 2;
	}
	
	
}
//if(speech_bubble_cooldown == 0)
//{
//	//speech_bubble_cooldown = speech_bubble_cooldown_max;
//	//speech_bubble_text = ;
//	set_text_bubble(choose("How deep can I go?","Wow, the Depths of hell","Don't get lost in the depth of it's eyes"))
//}

