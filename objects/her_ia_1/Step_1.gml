dist_p = point_distance(x, y, player.x, player.y)

if vie <= 0 {instance_destroy()}

//setup grille pour détecter player
if etat == 0 {mp_grid_clear_cell(grille, x_grille_player, y_grille_player)}
else {mp_grid_add_cell(grille, x_grille_player, y_grille_player)}
if (x_grille_player != player.x div dep_taille_ligne) or (y_grille_player != player.y div dep_taille_ligne) {
	x_grille_player = player.x div dep_taille_ligne
	y_grille_player = player.y div dep_taille_ligne
	etat = mp_grid_get_cell(grille, x_grille_player, y_grille_player)
}
mp_grid_clear_cell(grille, x_grille_player, y_grille_player)


// detecte
// première condition pour le game over
if player.visible
{
	if mp_grid_path(grille, chemin, x, y, player.x, player.y, true) and (point_distance(x_origine, y_origine, player.x, player.y) < 3000)
	{
		if (dist_p < portee_detection) and (not collision_line(x, y, player.x, player.y, her_murs, true, true))
		{
			detecte = true
			if compteur_detection == 0 {detect_anim(compteur_detection_max)}
		}
	}
	else {detecte = false}
}
else
{
	detecte = false
}
if detecte and compteur_detection < compteur_detection_max {compteur_detection ++}
if not detecte {compteur_detection = 0}


// reload
if reload < reload_max and not var_pause {reload ++}


// grille
if compteur_grille < 10 {compteur_grille ++}
if compteur_grille == 5 {
	mp_grid_destroy(grille)
	grille = mp_grid_create(0, 0, round(room_width/dep_taille_ligne), round(room_height/dep_taille_ligne), dep_taille_ligne, dep_taille_ligne)
	
	mp_grid_add_instances(grille, her_murs, true)
	mp_grid_add_instances(grille, her_mur_vie, true)
	mp_grid_add_instances(grille, detect_eau, true)
	while (mp_grid_get_cell(grille, (x_origine+dep_pos_attente+10) div dep_taille_ligne, y_origine div dep_taille_ligne) == 0) and (dep_pos_attente < 700)
	{
		dep_pos_attente += 10
	}
}


if pos_attente
{
	pos_attente = false
	x_origine += dep_pos_attente
	dep_pos_attente *= -1
}