if (x_camera != 0) or (y_camera != 0)
{
	x = cam_sync_x(x_camera)
	y = cam_sync_y(y_camera)
	set_scale(cam_sync_sc(scale))
}

draw_self()
draw_set_all(c_white, 1, fa_top, fa_center, F_police_texte)

if texte != 0
{
	var txt = saut_ligne_str(texte, 20)
	var sc = 0.7
	var txt2 = separer(txt, "\n")
	if array_length(txt2) > 1 {sc = 0.45}
	for (var i = 0; array_length(txt2) > i; i++)
	{
		draw_text_transformed(x, y-hauteur()*0.9+cam_sync_sc(string_height(txt2[0])*sc*i*0.8), txt2[i], cam_sync_sc(sc), cam_sync_sc(sc), 0)
	}
}
