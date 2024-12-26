if not var_pause
{
	compteur --
	if compteur <= 0 {instance_destroy()}
	image_alpha = compteur/compteur_max
}
part_emitter_region(global.part_sys, part_emit, x-largeur(), x+largeur(), y-hauteur(), y+hauteur(), ps_shape_ellipse, ps_distr_linear)
part_emitter_burst(global.part_sys, part_emit, part_2, -2)
part_emitter_burst(global.part_sys, part_emit, part_1, -2)
