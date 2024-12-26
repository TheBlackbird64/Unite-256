// deplacements et tirs
if not var_pause
{
	if detecte
	{
		image_angle = point_direction(x, y, player.x, player.y)
		if (dist_p < portee_tir) and (not collision_line(x, y, player.x, player.y, her_murs, true, true))
		{
			// tir
			if (reload == reload_max) and (compteur_detection == compteur_detection_max)
			{
				reload = 0
				event_user(14)
			}
		}
		else
		{
			if (compteur_detection == compteur_detection_max) {
				dep_path(chemin, vitesse, dep_taille_ligne/2)
			}
		}
	}
	else
	{
		if not mp_grid_path(grille, chemin, x, y, x_origine, y_origine, true)
		{
			deplacer_robot(x+lengthdir_x(image_angle, vitesse/2), y+lengthdir_y(image_angle, vitesse/2), dep_taille_ligne)
			image_angle = point_direction(x, y, x_origine, y_origine)
		}
		else
		{
			dep_path(chemin, vitesse/2, dep_taille_ligne/2)
			image_angle = point_direction(x, y, path_get_point_x(chemin, 1), path_get_point_y(chemin, 1))
		}
		
		if point_distance(x, y, x_origine, y_origine) < 10 {pos_attente = true} 
	}
}