part_local = part_type_create()
part_type_shape(part_local, pt_shape_square)
part_type_alpha3(part_local, 0, 0.8, 0)
part_type_color_rgb(part_local, 0, 0, 100, 200, 255, 255)
part_type_size(part_local, 0.05, 0.15, 0, 0)
part_type_life(part_local, 50, 80)
part_type_direction(part_local, 0, 359, 0, 10)
part_type_speed(part_local, 0.3*force, 1.5*force, 0, 0.2)

if dir > -1 {part_type_direction(part_local, dir-15, dir+15, 0, 0)}

part_sys_local = part_system_create()
part_system_depth(part_sys_local, depth)
part_emit = part_emitter_create(part_sys_local)