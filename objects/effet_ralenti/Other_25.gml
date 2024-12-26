var tab_ralenti = [0.2, 0.5, 0.8]
var tab_duree = [5*60, 5*60, 5*60]
var color = [[make_color_rgb(255, 255, 255), make_color_rgb(0, 100, 255)], [make_color_rgb(255, 255, 255), make_color_rgb(180, 180, 255)], [make_color_rgb(255, 255, 255), make_color_rgb(220, 220, 255)]]

coef_ralenti = tab_ralenti[nv_effet]
compteur_max = tab_duree[nv_effet]
compteur = compteur_max
if variable_instance_exists(_parent, "vitesse")
{
	_parent.vitesse = _parent.vitesse_base*(1-coef_ralenti)
}

part_1 = part_type_create()
part_type_shape(part_1, pt_shape_snow)
part_type_color2(part_1, color[nv_effet][0], color[nv_effet][1])
part_type_direction(part_1, 0, 359, 0, 5)
part_type_speed(part_1, 1, 2.5, 0, 2)
part_type_life(part_1, 25, 45)
part_type_alpha2(part_1, 1, 0)
part_type_size(part_1, 0.05, 0.25, 0, 0)

part_2 = part_type_create()
part_type_shape(part_2, pt_shape_sphere)
part_type_color1(part_2, $FFFFFF)
part_type_direction(part_2, 0, 359, 0, 5)
part_type_speed(part_2, 1, 2.5, 0, 2)
part_type_life(part_2, 25, 45)
part_type_alpha2(part_2, 1, 0)
part_type_size(part_2, 0.05, 0.25, 0, 0)