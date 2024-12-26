if not var_pause
{
	liste_lignes[num_ligne] ++
	if liste_lignes[num_ligne] >= compteur_max
	{
		num_ligne ++
		if num_ligne_max == num_ligne
		{
			num_ligne = 0
			liste_lignes = [0]
		}
		compteur_max = random_range(1, sprite_width*0.9)
		liste_lignes[num_ligne] = 0
	}
}