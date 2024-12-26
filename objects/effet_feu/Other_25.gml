var tab_degats = [5, 10, 20]
var tab_duree = [5*60, 10*60, 20*60]
var color = [[make_color_rgb(255, 232, 115), make_color_rgb(255, 0, 0)], [make_color_rgb(255, 255, 255), make_color_rgb(0, 255, 0)], [make_color_rgb(255, 255, 255), make_color_rgb(0, 0, 0)]]

degats = tab_degats[nv_effet]
compteur_max = tab_duree[nv_effet]
compteur = compteur_max
qte = 5

part_feu = part_type_create()
part_type_shape(part_feu, pt_shape_sphere)
part_type_color2(part_feu, color[nv_effet][0], color[nv_effet][1])
part_type_direction(part_feu, 45, 135, 0, 0)
part_type_gravity(part_feu, 0.1, sens)
part_type_speed(part_feu, 1, 4, -0.01, 0)
part_type_life(part_feu, 15, 25)
part_type_alpha2(part_feu, 1, 0.75)
part_type_size(part_feu, 0.1, 0.5, 0, 0)

part_feu2 = part_type_create()
part_type_shape(part_feu2, pt_shape_explosion)
part_type_alpha3(part_feu2, 0, 0.7, 0.2)
part_type_color2(part_feu2, $202020, $CCCCCC)
part_type_size(part_feu2, 0.2, 0.4, +0.02, 0.1)
part_type_life(part_feu2, 30, 60)
part_type_direction(part_feu2, 0, 359, 0, 10)
part_type_speed(part_feu2, 0.1, 0.6, -0.01, 0)
part_type_gravity(part_feu2, 0.1, sens)