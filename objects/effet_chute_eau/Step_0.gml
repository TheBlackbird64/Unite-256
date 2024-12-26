if not var_pause
{
	part_emitter_region(part_sys_local, part_emit, x-largeur(_parent), x+largeur(_parent), y-hauteur(_parent), y+hauteur(_parent), ps_shape_ellipse, ps_distr_linear)
	part_emitter_region(global.part_sys, part_emit2, x-largeur(_parent), x+largeur(_parent), y-hauteur(_parent), y+hauteur(_parent), ps_shape_rectangle, ps_distr_linear)
	
	if compteur < 35 and compteur > 30
	{
		part_emitter_burst(global.part_sys, part_emit2, part_local2, round(largeur(_parent)*hauteur(_parent)/50))
	}
	if compteur < 30
	{
		part_emitter_burst(part_sys_local, part_emit, part_local, 2)
	}
	
	if compteur == 0
	{
		with (_parent) {set_degats(id, vie_max)}
	}
}
