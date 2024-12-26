if not var_pause
{
	image_alpha = (portee/stats_modules_attaque(4, "portee"))*0.6
	
	portee --
	if portee == 0
	{
		instance_destroy()
	}
}
else
{
	speed = 0
}

if portee > stats_modules_attaque(4, "portee")-4 {generer_eclair($FF0030, x, y, depth, 10)}
part_system_position(part_sys, x, y)
part_emitter_region(part_sys, part_emit, -largeur(), largeur(), -hauteur(), hauteur(), ps_shape_ellipse, ps_distr_linear)
part_emitter_burst(part_sys, part_emit, part_elec, 8)