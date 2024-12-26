visible = false

portee = 0
degats = 0
stats_modules_attaque(3, "setup")
set_scale(0.25)

part_1 = part_type_create()
part_type_shape(part_1, pt_shape_snow)
part_type_color2(part_1, $FFFFFF, $FFDC00)
part_type_direction(part_1, 180, 359, 0, 0)
part_type_gravity(part_1, 0.05, 270)
part_type_speed(part_1, 1, 2.5, 0, 0)
part_type_life(part_1, 15, 35)
part_type_alpha2(part_1, 1, 0.75)
part_type_size(part_1, 0.05, 0.25, 0, 0)

part_2 = part_type_create()
part_type_shape(part_2, pt_shape_sphere)
part_type_color2(part_2, $FFFFFF, $FFDC00)
part_type_direction(part_2, 0, 359, 0, 5)
part_type_speed(part_2, 1, 2.5, 0, 2)
part_type_life(part_2, 25, 45)
part_type_alpha2(part_2, 1, 0)
part_type_size(part_2, 0.05, 0.25, 0, 0)

part_3 = part_type_create()
part_type_shape(part_3, pt_shape_snow)
part_type_color2(part_3, $FFFFFF, $FFDC00)
part_type_direction(part_3, 0, 359, 0, 0)
part_type_speed(part_3, 2, 8, -0.07, 0)
part_type_life(part_3, 5, 25)
part_type_alpha2(part_3, 1, 0.2)
part_type_size(part_3, 0.05, 0.25, 0, 0)

part_4 = part_type_create()
part_type_shape(part_4, pt_shape_sphere)
part_type_color1(part_4, $FFFFFF)
part_type_direction(part_4, 0, 359, 0, 0)
part_type_speed(part_4, 2, 8, -0.07, 0)
part_type_life(part_4, 5, 25)
part_type_alpha2(part_4, 1, 0.2)
part_type_size(part_4, 0.05, 0.25, 0, 0)

part_sys = part_system_create()
part_system_depth(part_sys, depth)

part_emit = part_emitter_create(part_sys)
part_emit2 = part_emitter_create(global.part_sys)