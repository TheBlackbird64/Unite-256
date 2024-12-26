if not var_pause
{
	speed = vitesse
	image_angle += 12
	portee --
	if portee == 0
	{
		instance_destroy()
	}
	
	var liste = ds_list_create()
	collision_circle_list(x, y, rayon, her_vie, true, true, liste, true)
	var tab_temp = liste_vers_tab(liste)
	if array_length(tab_temp) > 0
	{
		var inst = tab_temp[0]
		if tab_temp[0].id == _parent and (array_length(tab_temp) > 1) {inst = tab_temp[1]}
		if inst.id != _parent
		{
			direction += angle_difference(point_direction(x, y, inst.x, inst.y), direction)*0.1
		}
	}
	ds_list_destroy(liste)
}
else
{
	speed = 0
}

part_system_position(part_sys, x, y)
part_emitter_region(part_sys, part_emit, -rayon, rayon, -rayon, rayon, ps_shape_ellipse, ps_distr_linear)
part_emitter_burst(part_sys, part_emit, part_elec, 3)