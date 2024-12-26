function stats_modules_attaque(num, nom_stat)
{
	var tab_stats_noms =  ["degats", "portee", "depense_energie", "recharge", "vitesse"]
	if num == 1 {var tab_stats = [2, 40, 12, 75, 15]}
	if num == 2 {var tab_stats = [20, 80, 30, 50, 17]}
	if num == 3 {var tab_stats = [30, 90, 60, 65, 13]}
	if num == 4 {var tab_stats = [30, 30, 9, 30, 0]}
	if num == 5 {var tab_stats = [7, 70, 1, 10, 15]}
	if num == 6 {
		array_push(tab_stats_noms, "rayon")
		var tab_stats = [42, 120, 15, 55, 13, 100]
	}
	if num == 7 {var tab_stats = [7, 70, 1, 10, 15]}
	
	
	
	if nom_stat == "setup"
	{
		for (var i = 0; array_length(tab_stats_noms) > i; i++)
		{
			variable_instance_set(id, tab_stats_noms[i], tab_stats[i])
		}
	}
	else
	{
		return tab_stats[tab_index(tab_stats_noms, nom_stat)]
	}
}

function stats_modules_objets(num, nom_stat)
{
	var tab_stats_noms =  ["vie", "defense", "energie", "degats", "texte", "compteur"]
	if num == 1 {var tab_stats = [50, 0, 0, 0, "Régénère de la vie.", 0]}
	if num == 2 {var tab_stats = [100, 0, 0, 0, "Régénère de la vie.", 0]}
	if num == 3 {var tab_stats = [200, 0, 0, 0, "Régénère de la vie.", 0]}
	if num == 4 {var tab_stats = [300, 0, 0, 0, "Régénère de la vie.", 0]}
	if num == 5 {var tab_stats = [500, 0, 0, 0, "Régénère de la vie.", 0]}
	if num == 6 {var tab_stats = [1000, 0, 0, 0, "Régénère de la vie.", 0]}
	if num == 7 {var tab_stats = [999999999, 0, 0, 0, "Régénère de la vie.", 0]}
	if num == 8 {var tab_stats = [0, 0, 400, 0, "Ajoute de l'énergie.", 0]}
	if num == 9 {var tab_stats = [0, 0, 700, 0, "Ajoute de l'énergie.", 0]}
	if num == 10 {var tab_stats = [0, 0, 1200, 0, "Ajoute de l'énergie.", 0]}
	if num == 11 {var tab_stats = [0, 0, 2000, 0, "Ajoute de l'énergie.", 0]}
	if num == 12 {var tab_stats = [0, 0, 3100, 0, "Ajoute de l'énergie.", 0]}
	if num == 13 {var tab_stats = [0, 0, 5500, 0, "Ajoute de l'énergie.", 0]}
	if num == 14 {var tab_stats = [0, 0, 8000, 0, "Ajoute de l'énergie.", 0]}
	if num == 15 {var tab_stats = [0, 10, 0, 0, "Augmente la défense \n(valeur en %). Non cumulable\navec d'autres objets défensifs.", 45*60]}
	if num == 16 {var tab_stats = [0, 20, 0, 0, "Augmente la défense \n(valeur en %). Non cumulable\navec d'autres objets défensifs.", 45*60]}
	if num == 17 {var tab_stats = [0, 30, 0, 0, "Augmente la défense \n(valeur en %). Non cumulable\navec d'autres objets défensifs.", 45*60]}
	if num == 18 {var tab_stats = [0, 40, 0, 0, "Augmente la défense \n(valeur en %). Non cumulable\navec d'autres objets défensifs.", 45*60]}
	if num == 19 {var tab_stats = [0, 50, 0, 0, "Augmente la défense \n(valeur en %). Non cumulable\navec d'autres objets défensifs.", 30*60]}
	if num == 20 {var tab_stats = [0, 60, 0, 0, "Augmente la défense \n(valeur en %). Non cumulable\navec d'autres objets défensifs.", 30*60]}
	if num == 21 {var tab_stats = [0, 90, 0, 0, "Augmente la défense \n(valeur en %). Non cumulable\navec d'autres objets défensifs.", 30*60]}
	if num == 22 {var tab_stats = [0, 0, 0, 10, "Augmente l'attaque \n(valeur en %).", 45*60]}
	if num == 23 {var tab_stats = [0, 0, 0, 20, "Augmente l'attaque \n(valeur en %).", 45*60]}
	if num == 24 {var tab_stats = [0, 0, 0, 40, "Augmente l'attaque \n(valeur en %).", 45*60]}
	if num == 25 {var tab_stats = [0, 0, 0, 60, "Augmente l'attaque \n(valeur en %).", 45*60]}
	if num == 26 {var tab_stats = [0, 0, 0, 90, "Augmente l'attaque \n(valeur en %).", 30*60]}
	if num == 27 {var tab_stats = [0, 0, 0, 130, "Augmente l'attaque \n(valeur en %).", 30*60]}
	if num == 28 {var tab_stats = [0, 0, 0, 200, "Augmente l'attaque \n(valeur en %).", 30*60]}
	
	
	
	if nom_stat == "setup"
	{
		for (var i = 0; array_length(tab_stats_noms) > i; i++)
		{
			variable_instance_set(id, tab_stats_noms[i], tab_stats[i])
		}
	}
	else
	{
		return tab_stats[tab_index(tab_stats_noms, nom_stat)]
	}
}
