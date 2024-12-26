var coef = 0.92
var qte = 45
part_emitter_region(part_sys_local, part_emit, x-largeur()*coef, x+largeur()*coef, y-hauteur()*coef, y+hauteur()*coef, ps_shape_ellipse, ps_distr_linear)
part_emitter_burst(part_sys_local, part_emit, part_local, qte)
part_emitter_region(part_sys_local, part_emit, x-largeur()*coef, x+largeur()*coef, y-hauteur()*coef, y+hauteur()*coef, ps_shape_ellipse, ps_distr_invgaussian)
part_emitter_burst(part_sys_local, part_emit, part_local2, qte)
/*
part_emitter_region(part_sys_local, part_emit, x-largeur()*coef, x+largeur()*coef, y-hauteur()*coef, y+hauteur()*coef, ps_shape_ellipse, ps_distr_gaussian)
part_emitter_burst(part_sys_local, part_emit, part_local3, -100)