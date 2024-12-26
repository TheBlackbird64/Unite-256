//debug
if collision_point(mouse_x, mouse_y, id, false, false) and mouse_check_button_pressed(mb_left) and debug.active
{
	sys_elec_active = not sys_elec_active
}

if sys_elec_active {image_index = 0}
else {image_index = 1}