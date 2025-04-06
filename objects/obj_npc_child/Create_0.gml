/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



// Inherit the parent event
event_inherited();

forced_speech_list = [
"Why am I here? What happened to me?", obj_npc,
"A living soul in the depths of hell?", obj_control,
"You must have been brought so deep by a demon", obj_control,
"A demon, I knew that deep in my heart", obj_npc,
"They left a deep hole where my village was.", obj_npc,
"Can I follow you and wash away my deep shame?", obj_npc
];

choice_1 = function(){
	// gives buff, like 2 dodge charges and simultanous sword cast
	obj_expert.sword_casts += 1;
}

choice_2 = function(){
	// he follows with mini skills or just casts swords from time to time
	instance_create_layer(x,y,layer,obj_follower);
}

choice_list = [
"I will deep clean the depths of hell for you", choice_1,
"Come let us dive, cut and clean deep!", choice_2
];

