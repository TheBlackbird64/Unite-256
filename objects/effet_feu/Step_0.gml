if not var_pause
{
	compteur_degats ++
	if compteur_degats == 30
	{
		compteur_degats = 0
		set_degats(_parent, degats)
	}

}
try {
part_emitter_region(global.part_sys, part_emit, -largeur(_parent), largeur(_parent), -hauteur(_parent), hauteur(_parent), ps_shape_ellipse, ps_distr_linear)
} catch (e) {}
part_emitter_burst(global.part_sys, part_emit, part_feu, qte)
part_emitter_burst(global.part_sys, part_emit, part_feu2, qte)