///@description anim detruire
part_armeA = part_type_create()
part_type_shape(part_armeA, pt_shape_flare)
part_type_alpha2(part_armeA, 1, 0.5)
part_type_color_rgb(part_armeA, 255, 255, 0, 130, 0, 0)
part_type_size(part_armeA, 0.3, 0.5, -0.02, 0)
part_type_life(part_armeA, 10, 30)
part_type_direction(part_armeA, 0, 359, 0, 0)
part_type_speed(part_armeA, 1, 3, -0.02, 0)

part_armeB = part_type_create()
part_type_shape(part_armeB, pt_shape_explosion)
part_type_alpha2(part_armeB, 0.8, 0.5)
part_type_color2(part_armeB, $333333, $CCCCCC)
part_type_size(part_armeB, 0.4, 0.7, -0.02, 0)
part_type_life(part_armeB, 20, 50)
part_type_direction(part_armeB, 0, 359, 0, 0)
part_type_speed(part_armeB, 0.5, 4, -0.02, 0)

/*if speed > 0 {
	x = x + lengthdir_x(sprite_width/2, direction)
	y = y + lengthdir_y(sprite_width/2, direction)
}*/

part_particles_create(global.part_sys, x, y, part_armeB, 70)
part_particles_create(global.part_sys, x, y, part_armeA, 20)