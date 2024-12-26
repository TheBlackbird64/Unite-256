set_scale(cam_sync_sc(0.05))

if (mouse_check_button_pressed(mb_left))
{
	image_index = 1
	x1 = window_mouse_get_x()
	y1 = window_mouse_get_y()
	x2 = x
	y2 = y
}
if (mouse_check_button(mb_left))
{
	x = cam_sync_sc(x1 - window_mouse_get_x()) + x2
	y = cam_sync_sc(y1 - window_mouse_get_y()) + y2
}
if (x < camera_get_view_width(view_camera[0])/2)
{
	x = camera_get_view_width(view_camera[0])/2
}
if (x > room_width - camera_get_view_width(view_camera[0])/2)
{
	x = room_width - camera_get_view_width(view_camera[0])/2
}
if (y < camera_get_view_height(view_camera[0])/2)
{
	y = camera_get_view_height(view_camera[0])/2
}
if (y > room_height - camera_get_view_height(view_camera[0])/2)
{
	y = room_height - camera_get_view_height(view_camera[0])/2
}


if mouse_check_button_released(mb_left)
{
	inst_aide.active = false
	image_index = 0
}
