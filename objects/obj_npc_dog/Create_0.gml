/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();

forced_speech_list = [
"What? There lives a dog in the depths of hell?", obj_control,
"I better not deeply stare into ints deep puppy eyes", obj_control,
" *woof*", obj_npc,
"Might be some deep hellish scheme, better not trust it", obj_control,
"*intense deep stare*", obj_npc,
];

choice_1 = function(){
	// gives buff, like 2 dodge charges and simultanous sword cast
	obj_expert.hp_bars[choose(2,3)] = 0;
	obj_control.set_text_bubble("It took a deep bite out of my hand!")
	instance_create_layer(x,y,layer,obj_dog);
	instance_create_layer(x,y,layer,obj_timer);
}

choice_2 = function(){
	// he follows with mini skills or just casts swords from time to time
	var _dog = instance_create_layer(x,y,layer,obj_dog);
	_dog.hp -= 200;
	obj_control.set_text_bubble("Go into a deep slumber")
	instance_create_layer(x,y,layer,obj_timer);
}

choice_list = [
"Pet the puppy", choice_1,
"Kick the beast", choice_2
];