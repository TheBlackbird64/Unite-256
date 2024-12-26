compteur = 0
set_scale(0.2)

part_local = part_type_create()
part_type_shape(part_local, pt_shape_flare)
part_type_alpha2(part_local, 1, 0.5)
part_type_color2(part_local, $FFFFFF, $FF0000)
part_type_size(part_local, 0.3, 0.5, 0.01, 0.2)
part_type_life(part_local, 50, 70)
part_type_direction(part_local, 0, 359, 0, 15)
part_type_speed(part_local, 0.4, 0.7, 0, 0.1)

part_local2 = part_type_create()
part_type_shape(part_local2, pt_shape_flare)
part_type_alpha2(part_local2, 1, 0.5)
part_type_color2(part_local2, $FFFFFF, $FF0000)
part_type_size(part_local2, 0.2, 0.3, 0, 0)
part_type_life(part_local2, 40, 80)
part_type_direction(part_local2, 0, 359, 6, 0)
part_type_speed(part_local2, 1.5, 3.5, 0, 0)

part_sys_local = part_system_create()
part_system_depth(part_sys_local, -30)