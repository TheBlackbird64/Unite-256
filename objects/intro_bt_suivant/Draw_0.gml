if (x_camera != 0) or (y_camera != 0)
{
	x = cam_sync_x(x_camera)
	y = cam_sync_y(y_camera)
	set_scale(cam_sync_sc(scale))
}

draw_self()

draw_set_all(c_white, 1, fa_center, fa_middle, F_police_boutons)
if texte != 0 {draw_text_transformed(x, y, texte, cam_sync_sc(1), cam_sync_sc(1), 0)}
