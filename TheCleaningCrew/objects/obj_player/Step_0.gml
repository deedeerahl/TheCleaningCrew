/// @description Insert description here
// You can write your code in this editor

//------------UPDATE INPUT
input_left	= keyboard_check(vk_left);
input_right	= keyboard_check(vk_right);
input_up	= keyboard_check(vk_up);
input_down	= keyboard_check(vk_down);
input_walk	= keyboard_check(vk_control);
input_run	= keyboard_check(vk_shift);
interact_key = keyboard_check(vk_return);
interacting = false;


//------------ALTER SPEED
if(input_walk or input_run){
	spd = abs((input_walk*w_spd) - (input_run*r_spd));
	}
else {
	spd = n_spd;
	}

//------------RESET MOVE VARIABLES
moveX = 0;
moveY = 0;

//------------INTENDED MOVEMENT
moveX = (input_right - input_left) * spd;

if(moveX == 0){
	moveY = (input_down - input_up) * spd;
	}

//------------COLLISION CHECKS
if (moveX != 0){
	if (place_meeting(x+moveX, y, obj_collision)){
		repeat(abs(moveX)){
			if(!place_meeting(x+sign(moveX), y, obj_collision)){
				x += sign(moveX);
				}
			else {
				break;
				}
			}
			moveX = 0;
		}
	}
	
if (moveY != 0){
	if (place_meeting(x, y+moveY, obj_collision)){
		repeat(abs(moveY)){
			if(!place_meeting(x, y+sign(moveY), obj_collision)){
				y += sign(moveY);
				}
			else {
				break;
				}
			}
			moveY = 0;
		}
	}

//------------UPDATE SPRITE ||I KNOW IT's UGLY, I'M FIGURING OUT HOW TO OPTIMIZE THIS
if (moveX < 0){
	image_speed = spd/3;
	sprite_index = spr_Deedee_Left;
}
if (moveX > 0){
	image_speed = spd/3;
	sprite_index = spr_Deedee_Right;
}
if (moveY > 0){
	image_speed = spd/3;
	sprite_index = spr_Deedee_Down;
}
if (moveY < 0){
	image_speed = spd/3;
	sprite_index = spr_Deedee_Up;
}
if (moveX == 0) and(moveY == 0){
	image_speed = 0;
	image_index = 0;
}

//------------APPLY MOVEMENT
x += moveX;
y += moveY;

//-----------interaction code
if (interact_key)
{
	if(place_meeting(x,y,obj_lever) || place_meeting(x-1,y,obj_lever) || place_meeting(x,y-1,obj_lever) ||place_meeting(x+1,y,obj_lever) || place_meeting(x,y+1,obj_lever) )
	{
		target = instance_nearest(x,y,obj_lever);
		if(target!=noone){
			target.active = !target.active;
			}
	}
}