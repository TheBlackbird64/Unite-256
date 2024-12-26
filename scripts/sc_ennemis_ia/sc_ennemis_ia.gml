/*
function setup_grille_player(grille, taille_cell)
{
	static x_grille_player = 0
	static y_grille_player = 0
	static etat = -1
	
	if etat == 0 {mp_grid_clear_cell(grille, x_grille_player div taille_cell, y_grille_player div taille_cell)}
	else {mp_grid_add_cell(grille, x_grille_player div taille_cell, y_grille_player div taille_cell)}
	
	if (x_grille_player != player.x) or (y_grille_player != player.y) {
		x_grille_player = player.x
		y_grille_player = player.y
	}
}