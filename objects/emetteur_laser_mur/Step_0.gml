if compteur > compteur_max {compteur = -compteur_max}
compteur ++

if type_laser_mur == 1
{
	col2 = make_color_hsv(abs(compteur/compteur_max)*50, 255, 255)
}
if type_laser_mur == 2
{
	col2 = make_color_hsv(160 - abs(compteur/compteur_max)*50, 255, 255)
}

if longueur != 0
{
	var _x = x
	var _y = y
	
	if module_spe(type_laser_mur+2) {inst_mur.image_xscale = 0}
	else {inst_mur.image_xscale = longueur/10}
	
	with (inst_mur) {deplacer_mur(_x, _y)}

	part_system_position(part_sys_local, x, y)
	part_type_color1(part_local, col2)
	part_type_color2(part_local2, c_white, col2)
	
	part_emitter_region(part_sys_local, part_emit, 0, lengthdir_x(longueur, image_angle), 0, lengthdir_y(longueur, image_angle), ps_shape_line, ps_distr_linear)
	var qte = round(0.002*longueur)
	if qte == 0 and irandom_range(0, 5) == 1 {qte = 1}
	part_emitter_burst(part_sys_local, part_emit, part_local, qte)
	part_emitter_burst(part_sys_local, part_emit, part_local2, round(0.1*longueur))
}