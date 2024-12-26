
compteur_max = 120
compteur = irandom_range(-compteur_max, compteur_max)
col2 = c_red

inst_mur = instance_create_depth(x, y, 0, detect_mur_lasers)
inst_mur.image_xscale = longueur/10 // dans étape
inst_mur.image_angle = image_angle


part_local = part_type_create()
part_type_sprite(part_local, S_emetteur_laser_mur_part, 0, 0, 0)
part_type_alpha2(part_local, 1, 0.5)
part_type_size(part_local, 0.1, 0.2, 0.02, 0.05)
part_type_life(part_local, 10, 45)

part_local2 = part_type_create()
part_type_shape(part_local2, pt_shape_line)
part_type_alpha2(part_local2, 1, 0.5)
part_type_size(part_local2, 0.2, 0.5, 0, 0.05)
part_type_life(part_local2, 5, 10)
part_type_direction(part_local2, 0, 359, 0, 15)
part_type_speed(part_local2, 0.3, 1.5, -0.01, 0)
part_type_orientation(part_local2, image_angle, image_angle, 0, 0, 0)

part_sys_local = part_system_create()
part_system_depth(part_sys_local, depth)

part_emit = part_emitter_create(part_sys_local)