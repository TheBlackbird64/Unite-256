event_inherited()

draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, c_white, 1)
draw_sprite_ext(sprite_index, 3, x+lengthdir_x(4*(compteur_anim/compteur_anim_max), image_angle), y+lengthdir_y(4*(compteur_anim/compteur_anim_max), image_angle), image_xscale, image_yscale, image_angle, c_white, 1)
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1)
if compteur_anim2 > compteur_anim_max2/2 {
	draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_white, 1)
}
else {
	draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, $00FFFF, 1)
}
