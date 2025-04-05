/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

image_speed = 0;


forced_speech_index = 0;

forced_speech_list = [
"Master Dep-ths, my deepest condolences.", obj_npc,
"Deep honor cultivator, what are you talking about?", obj_control,
"It was the bandits, from the forest depths", obj_npc,
"We've been attacked, your wife suffered deep trauma", obj_npc,
"What?! My sword will bathe in deep crimson!", obj_control,
"She died, but we sent them to the depths of hell", obj_npc,
"That won't do as their punishment!", obj_control,
"I will plunge the depths of hell to find them!",obj_control,
"Oh my! His hatred runs deep!", obj_npc
];


choice_1 = function(){
	obj_expert.sword_hits += 1;
	obj_expert.sword_strength += 4;
	obj_expert.sword_turn_speed += 5;
}

choice_2 = function(){
	obj_expert.special_flurry_hits += 2;
}

choice = false;

choices = [0,0];

choice_list = [
"Let my swords cut deep throught the depths!", choice_1 ,
"Deep fist punches will let me dive deeper!", choice_2
]




speech_bubble_timer = 0;
speech_bubble_text = "";
speech_bubble_cooldown = 0
speech_bubble_cooldown_max = obj_control.game_speed*4;

set_text_bubble = function(_text){
	speech_bubble_text = _text;
	speech_bubble_cooldown = speech_bubble_cooldown_max;
	speech_bubble_timer = 0
}
