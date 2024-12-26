//particules
part_emitter_region(part_sys_local, part_emit, x-largeur()+10, x+largeur()-10, y-hauteur()+10, y+hauteur()-10, ps_shape_rectangle, ps_distr_linear)
for (var i = 0; round(image_xscale*image_yscale) > i; i++)
{
	if (irandom_range(0, round(3/force)) == 0) {part_emitter_burst(part_sys_local, part_emit, part_local, 1)}
}

