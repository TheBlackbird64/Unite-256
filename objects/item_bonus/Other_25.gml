///@description event creer rajouts
// sauvegarde_id = bonus_nvX pour tout les bonus
set_scale(0.15)

if tab_index(global.items_recup, string(sauvegarde_id)) != -1 {image_alpha = 0.5}

part_obj2 = part_type_create()
part_type_alpha2(part_obj2, 1, 0.2)
part_type_color_rgb(part_obj2, 180, 255, 180, 255, 180, 255)
part_type_direction(part_obj2, 0, 359, 0, 0)
part_type_gravity(part_obj2, 0.1, 270)
part_type_life(part_obj2, 25, 50)
part_type_shape(part_obj2, pt_shape_flare)
part_type_size(part_obj2, 0.1, 0.5, -0.005, 0.1)
part_type_speed(part_obj2, 0.3, 1, 0, 0)


part_obj = part_type_create()
part_type_alpha3(part_obj, 0.2, image_alpha, 0.2)
//part_type_color_rgb(part_obj, 0, 255, 0, 255, 0, 255)
//part_type_direction(part_obj, 0, 359, 0, 0)
part_type_life(part_obj, 40, 80)
part_type_shape(part_obj, pt_shape_flare)
part_type_size(part_obj, 0.05, 0.2, 0, 0.05)
//part_type_speed(part_obj, 0.05, 0.1, 0, 0)

part_sys = part_system_create()
part_system_depth(part_sys, depth)
part_emit = part_emitter_create(part_sys)

compteur_col = 0