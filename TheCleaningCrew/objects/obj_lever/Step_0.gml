interact_key = keyboard_check_released(vk_return);  //we use return for interacting. 


if(interact_key)  
{
	target = instance_nearest(x,y,obj_player);  //find the nearest object...only looking for levers now.. 
		if(distance_to_object(target)<2) //check we're close to our object.
		{
			if(target!=noone){  //check the target isn't null.
				active=!active;
			}
		}
}

if(active)
{
	image_index = 1;
}
else
{
	image_index = 0;
}