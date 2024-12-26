compteur_col += 0.01
if compteur_col > 1 {compteur_col = -1}
var col = make_color_hsv(abs(compteur_col)*255, 255, 255)

draw_sprite_ext(sprite_index, 0, x, y, image_xscale*0.75, image_yscale*0.75, 0, c_black, image_alpha/2)
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, col, image_alpha)

part_system_position(part_sys, x, y)
part_emitter_region(part_sys, part_emit, -largeur(), largeur(), -hauteur(), hauteur(), ps_shape_ellipse, ps_distr_gaussian)
part_emitter_burst(part_sys, part_emit, part_obj, 10)