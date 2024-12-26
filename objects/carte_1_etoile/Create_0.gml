depth = -15

part_local = part_type_create()
part_type_shape(part_local, pt_shape_flare)
part_type_alpha3(part_local, 0, 0.5, 0)
part_type_color_rgb(part_local, 255, 255, 160, 210, 0, 0)
part_type_size(part_local, 0.1, 0.3, 0, 0)
part_type_life(part_local, 120, 240)

part_local2 = part_type_create()
part_type_shape(part_local2, pt_shape_flare)
part_type_alpha3(part_local2, 0, 0.5, 0)
part_type_color_rgb(part_local2, 255, 255, 80, 150, 0, 0)
part_type_size(part_local2, 0.1, 0.3, 0, 0)
part_type_life(part_local2, 120, 240)
/*
part_local3b = part_type_create()
part_type_shape(part_local3b, pt_shape_flare)
part_type_alpha3(part_local3b, 0, 0.5, 0)
part_type_color_rgb(part_local3b, 255, 255, 120, 220, 0, 0)
part_type_size(part_local3b, 0.1, 0.3, 0, 0)
part_type_life(part_local3b, 120, 240)

part_local3 = part_type_create()
part_type_shape(part_local3, pt_shape_flare)
part_type_alpha1(part_local3, 0)
part_type_life(part_local3, 120, 240)
part_type_direction(part_local3, 0, 359, 10, 5)
part_type_speed(part_local3, 0.4, 0.6, 0.01, 0.05)
part_type_step(part_local3, 2, part_local3b)
*/
part_sys_local = part_system_create()
part_system_depth(part_sys_local, depth)
part_emit = part_emitter_create(part_sys_local)
