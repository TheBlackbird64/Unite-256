part_2 = part_type_create()
part_type_shape(part_2, pt_shape_snow)
part_type_color2(part_2, $FFFFFF, $FFDC00)
part_type_direction(part_2, 0, 359, 0, 5)
part_type_speed(part_2, 1, 2.5, 0, 2)
part_type_life(part_2, 25, 45)
part_type_alpha2(part_2, 1, 0)
part_type_size(part_2, 0.05, 0.25, 0, 0)

part_1 = part_type_create()
part_type_shape(part_1, pt_shape_sphere)
part_type_color2(part_1, $FFFFFF, $FFDC00)
part_type_direction(part_1, 0, 359, 0, 5)
part_type_speed(part_1, 1, 2.5, 0, 2)
part_type_life(part_1, 25, 45)
part_type_alpha2(part_1, 1, 0)
part_type_size(part_1, 0.05, 0.25, 0, 0)

part_emit = part_emitter_create(global.part_sys)

set_scale(0.5)
compteur_max = 240
compteur = compteur_max