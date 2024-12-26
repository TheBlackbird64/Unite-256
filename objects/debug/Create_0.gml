active = false
depth = -15000

montrer1 = false
montrer2 = false
invincible = false
// ne pas supprimper l'objet, simplement le désactiver!


// test particules
part_test = false
/*
part_test = true
part_local = part_type_create()
part_type_shape(part_local, pt_shape_line)
part_type_alpha2(part_local, 1, 0.7)
part_type_color_rgb(part_local, 0, 0, 200, 255, 0, 0)
part_type_size(part_local, 0.3, 0.5, 0, 0.1)
part_type_life(part_local, 2, 5)
part_type_orientation(part_local, 0, 359, 0, 0, 0)

part_emit = part_emitter_create(global.part_sys)