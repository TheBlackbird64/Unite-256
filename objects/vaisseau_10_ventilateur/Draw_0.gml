draw_self()

if not var_pause
{
	compteur -= 10
	if compteur < 0 {compteur += 360}
}

draw_sprite_ext(sprite_index, 1, x, y-18, image_xscale, image_yscale, compteur, c_white, 1)
draw_sprite_ext(sprite_index, 2, x, y-18, image_xscale, image_yscale, image_angle, c_white, 1)