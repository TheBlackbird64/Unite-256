if compteur > compteur_max {compteur = -compteur_max}
compteur ++

if (module_id == 3 or module_id == 4) and active and not var_pause
{
	if module_id == 3
	{
		col2 = make_color_hsv(abs(compteur/compteur_max)*50, 255, 255)
	}
	if module_id == 4
	{
		col2 = make_color_hsv(160 - abs(compteur/compteur_max)*50, 255, 255)
	}
	
	part_system_position(part_sys_local, player.x, player.y)
	part_type_color1(part_local, col2)
	part_emitter_region(part_sys_local, part_emit, -largeur(player), largeur(player), -hauteur(player), hauteur(player), ps_shape_ellipse, ps_distr_linear)
	if irandom_range(0, 5) == 1 part_emitter_burst(part_sys_local, part_emit, part_local, 1)
}
