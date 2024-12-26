if not alerte
{
	if liste_col[col] != 0
	{
		draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, liste_col[col], 1)
	}
}
else
{
	if compteur > compteur_max/2 {
		draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_red, 1)
	}
}