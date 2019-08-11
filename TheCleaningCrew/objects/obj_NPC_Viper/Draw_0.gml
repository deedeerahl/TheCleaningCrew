/// @description Insert description here
// You can write your code in this editor

var anim_lenght = 4;
var anim_speed = 8;
var frame_width = 32;
var frame_height = 64;

var xx = x - x_offset;
var yy = y - y_offset;

if (moveY > 0) y_frame = 0;
else if (moveX < 0) y_frame = 1;
else if (moveX > 0) y_frame = 2;
else if (moveY < 0) y_frame = 3;
else x_frame = 0;

//INCREMENT FRAME FOR ANIMATION
if (x_frame + (anim_speed/60) < anim_lenght) {

	x_frame += anim_speed/60;

} else {
	
	x_frame = 0;
	
}

//DRAW CHARACTER BASE
draw_sprite_part(spr_character, 0, floor(x_frame)*frame_width, y_frame*frame_height, frame_width, frame_height, xx, yy);
