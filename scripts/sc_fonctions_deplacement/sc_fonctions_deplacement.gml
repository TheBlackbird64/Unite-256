// deplacements
function debug_draw_line_col() //debug
{
	if debug.active and variable_instance_exists(id, "dep_longV")
	{
		draw_set_color(c_red)
		draw_line(x+dep_ecartV, y-dep_longV, x+dep_ecartV, y+dep_longV) //droite
		draw_line(x-dep_ecartV, y-dep_longV, x-dep_ecartV, y+dep_longV) //gauche
		draw_line(x-dep_longH, y-dep_ecartH, x+dep_longH, y-dep_ecartH) // haut
		draw_line(x-dep_longH, y+dep_ecartH, x+dep_longH, y+dep_ecartH) // bas
	}
}

function dep_verif_collision_p_gauche(long, ecart)
{
	return collision_line(x+ecart, y-long, x+ecart, y+long, her_solide, true, true)
}

function dep_verif_collision_p_droite(long, ecart)
{
	return collision_line(x-ecart, y-long, x-ecart, y+long, her_solide, true, true)
}

function dep_verif_collision_p_haut(long, ecart)
{
	return collision_line(x-long, y+ecart, x+long, y+ecart, her_solide, true, true)
}

function dep_verif_collision_p_bas(long, ecart)
{
	return collision_line(x-long, y-ecart, x+long, y-ecart, her_solide, true, true)
}

function dep_verif_mur()
{
	dep_bloque()
	while dep_verif_collision_p_droite(dep_longV, dep_ecartV) {
		x += 1
	}
	while dep_verif_collision_p_gauche(dep_longV, dep_ecartV) {
		x -= 1
	}
	while dep_verif_collision_p_bas(dep_longH, dep_ecartH) {
		y += 1
	}
	while dep_verif_collision_p_haut(dep_longH, dep_ecartH) {
		y -= 1
	}
}

function dep_bloque()
{
	static test_part_local = 0
	if debug.active and test_part_local == 0{ // particules debug
		static test_part_local = part_type_create()
		part_type_shape(test_part_local, pt_shape_flare)
		part_type_alpha2(test_part_local, 1, 0.2)
		part_type_size(test_part_local, 1, 1, 0, 0)
		part_type_life(test_part_local, 60, 60)
	}
	
	var _x = x
	var _y = y
	var angle = 0
	var longueur = 0
	while (dep_verif_collision_p_droite(dep_longV, dep_ecartV) and dep_verif_collision_p_gauche(dep_longV, dep_ecartV)) or (dep_verif_collision_p_bas(dep_longH, dep_ecartH) and dep_verif_collision_p_haut(dep_longH, dep_ecartH))
	{
		x = _x
		y = _y
		x = x+lengthdir_x(longueur, angle)
		y = y+lengthdir_y(longueur, angle)
		if debug.active {part_particles_create(global.part_sys, x, y, test_part_local, 1)}//debug
		
		angle += 15
		if angle >= 360 {
			longueur += 10
			angle = 0
		}
	}
}

function deplacer_robot(_x, _y, long_ligne_col=0, ligne_adapt_rotation=false) // dernier paramètre pour les robots qui ne sont pas du tout carrés
{
	if ligne_adapt_rotation
	{
		dep_longV = hauteur()-10
		dep_longH = largeur()-10
		dep_ecartV = largeur()
		dep_ecartH = hauteur()
	}
	else
	{
		var moy = (hauteur()+largeur())/2
		dep_longV = moy-10
		dep_longH = moy-10
		dep_ecartV = moy
		dep_ecartH = moy
	}
	if long_ligne_col != 0
	{
		dep_longV = long_ligne_col
		dep_longH = long_ligne_col
	}
	
	var dep_diff = _x-x
	var dep_compteur = 0
	var aj_x = dep_diff/abs(dep_diff)*1 // pr gagner du temps de calcul on peut faire *qqch pr ne pas avancer 1 par 1
	while abs(dep_compteur) < abs(dep_diff)
	{
		if abs(dep_diff) < abs(dep_compteur) + abs(aj_x) {aj_x = dep_diff/abs(dep_diff)}
		x += aj_x
		dep_compteur += aj_x
		dep_verif_mur()
	}
	
	dep_diff = _y-y
	dep_compteur = 0
	var aj_y = dep_diff/abs(dep_diff)*1 // pr gagner du temps de calcul on peut faire *qqch pr ne pas avancer 1 par 1
	while abs(dep_compteur) < abs(dep_diff)
	{
		if abs(dep_diff) < abs(dep_compteur) + abs(aj_y) {aj_y = dep_diff/abs(dep_diff)}
		y += aj_y
		dep_compteur += aj_y
		dep_verif_mur()
	}
}


function dep_liste_verif_robot(tab)
{
	for (var i = 0; array_length(tab) > i; i++)
	{
		with (tab[i]) {dep_verif_mur()}
	}
}

function deplacer_mur(_x, _y)
{
	var liste = ds_list_create()
	collision_circle_list(x, y, plus_grand_cote()*2, her_robots, false, true, liste, false)
	var tab_robot = liste_vers_tab(liste)
	ds_list_destroy(liste)
	
	var dep_diff = _x-x
	var dep_compteur = 0
	var aj_x = dep_diff/abs(dep_diff)*2 // pr gagner du temps de calcul on peut faire *qqch pr ne pas avancer 1 par 1
	while abs(dep_compteur) < abs(dep_diff)
	{
		if abs(dep_diff) < abs(dep_compteur) + abs(aj_x) {aj_x = dep_diff/abs(dep_diff)}
		x += aj_x
		dep_compteur += aj_x
		dep_liste_verif_robot(tab_robot)
	}
	
	dep_diff = _y-y
	dep_compteur = 0
	var aj_y = dep_diff/abs(dep_diff)*2 // pr gagner du temps de calcul on peut faire *qqch pr ne pas avancer 1 par 1
	while abs(dep_compteur) < abs(dep_diff)
	{
		if abs(dep_diff) < abs(dep_compteur) + abs(aj_y) {aj_y = dep_diff/abs(dep_diff)}
		y += aj_y
		dep_compteur += aj_y
		dep_liste_verif_robot(tab_robot)
	}
}

// pour les her_robot qui se servent des chemins, au lieu d'utiliser path_start()
function dep_path(chemin_id, vitesse, long_ligne_col=0)
{
	var dir = point_direction(x, y, path_get_point_x(chemin_id, 1), path_get_point_y(chemin_id, 1))
	deplacer_robot(x+lengthdir_x(vitesse, dir), y+lengthdir_y(vitesse, dir), long_ligne_col)
}