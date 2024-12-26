// module = 1
if module_id == 1 and active and not var_pause
{
	shader_set(Shader_noir_blanc)
}
else
{
	shader_reset()
}

// module = 2
if module_id == 2 and active and not var_pause
{
	depth = -40
	draw_set_all(c_white)
	draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), cam_sync_x(1366), cam_sync_y(768), false)
}


// module = 3 et 4
if (module_id == 3 or module_id == 4) and active and not var_pause
{
	depth = player.depth
	with (player) {image_alpha = 0}
	effectue = false
	if module_id == 3 {var col = $0080FF}
	if module_id == 4 {var col = $FF8000}
	draw_sprite_ext(player.sprite_index, 1, player.x, player.y, player.image_xscale, player.image_yscale, player.image_angle, col, 0.3)
}
else
{
	if not effectue
	{
		effectue = true
		with (player) {image_alpha = 1}
	}
}


