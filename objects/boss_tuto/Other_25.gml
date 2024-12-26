set_scale(0.3)

array_push(tab_id_parties_robots, instance_create_depth(x, y, depth-1, boss_tuto_2))
array_push(tab_id_parties_robots, instance_create_depth(x, y, depth-2, boss_tuto_3))

pattern_active = false
num_pattern = 0
tps_attente = 0
tps_attente_max = 30
detect = false
active = true
effectue_cycle_attaque_2 = false
allow_hitflash = true
vie2 = 0


part_arme_boss = part_type_create()
part_type_shape(part_arme_boss, pt_shape_explosion)
part_type_alpha2(part_arme_boss, 1, 0.2)
part_type_color2(part_arme_boss, $202020, $CCCCCC)
part_type_size(part_arme_boss, 0.4, 0.7, +0.02, 0.1)
part_type_life(part_arme_boss, 30, 60)
part_type_direction(part_arme_boss, 0, 359, 0, 10)
part_type_speed(part_arme_boss, 0.1, 0.6, -0.01, 0)
part_type_gravity(part_arme_boss, 0.1, 90)


part_emit = part_emitter_create(global.part_sys)
part_sys_local = part_system_create()
part_system_depth(part_sys_local, -30)