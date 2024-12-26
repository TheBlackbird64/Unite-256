active = false
module_id = 0
effectue = false


part_local = part_type_create()
part_type_sprite(part_local, S_emetteur_laser_mur_part, 0, 0, 0)
part_type_alpha2(part_local, 1, 0.5)
part_type_size(part_local, 0.05, 0.1, 0.01, 0.03)
part_type_life(part_local, 10, 45)

part_sys_local = part_system_create()
part_system_depth(part_sys_local, depth)

part_emit = part_emitter_create(part_sys_local)

compteur_max = 120
compteur = 0