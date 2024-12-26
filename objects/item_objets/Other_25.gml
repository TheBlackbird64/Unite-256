///@description event creer rajouts
num_obj = image_index+1

part_obj = part_type_create()
part_type_alpha2(part_obj, 1, 0.2)
part_type_color_rgb(part_obj, 180, 255, 180, 255, 180, 255)
part_type_direction(part_obj, 0, 359, 0, 0)
part_type_gravity(part_obj, 0.1, 270)
part_type_life(part_obj, 25, 50)
part_type_shape(part_obj, pt_shape_flare)
part_type_size(part_obj, 0.1, 0.5, -0.005, 0.1)
part_type_speed(part_obj, 0.3, 1, 0, 0)

part_sys = part_system_create()
part_system_depth(part_sys, depth-1)
part_emit = part_emitter_create(part_sys)

set_scale(0.4)


inst_aide = instance_create_depth(x, y, -40, tuto_aide)
inst_aide.active = false
inst_aide.texte = "Inventaire plein !"
with (inst_aide) {set_scale(0.5)}
