if not var_pause
{
	speed = vitesse
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

part_emitter_region(global.part_sys, part_emit2, x-largeur(), x+largeur(), y-hauteur(), y+hauteur(), ps_shape_ellipse, ps_distr_linear)
part_emitter_burst(global.part_sys, part_emit2, part_2, -2)

part_system_position(part_sys, x, y)
part_emitter_region(part_sys, part_emit, -largeur(), largeur(), -hauteur(), hauteur(), ps_shape_ellipse, ps_distr_linear)
part_emitter_burst(part_sys, part_emit, part_1, 1)