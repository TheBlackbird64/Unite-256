if not var_pause
{
	if not sys_elec_energie
	{
		image_index = 1
		var longueur = sprite_width
		if sprite_width < sprite_height {longueur = sprite_height}
		if abs(x - _x) < longueur*0.9 {deplacer_mur(x+deplacement_x, y)}
		if abs(y - _y) < longueur*0.9 {deplacer_mur(x, y+deplacement_y)}
	}
	else
	{
		image_index = 0
		if abs(x - _x) > 0 {deplacer_mur(x-deplacement_x, y)}
		if abs(y - _y) > 0 {deplacer_mur(x, y-deplacement_y)}
	}
}
