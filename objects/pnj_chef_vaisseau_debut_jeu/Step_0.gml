if num_cine == -1
{
	compteur --
	if compteur == 0 {num_cine = 0}
}
if num_cine == 0
{
	player.image_angle = point_direction(player.x, player.y, x, y)
	num_cine ++
	cinematique(["Bienvenue à bord du vaisseau! \nMon nom de code est Nexus-096.",
	"Je suis le capitaine de ce vaisseau, et mon rôle est de m'assurer que ta mission se déroule comme prévu.",
	"Ce vaisseau te servira de base le temps que tu trouves le chef rebelle et que tu le détruise. Différents équipements sont présent à bord pour t'aider à accomplir la mission.",
	"Je te laisse explorer le vaisseau pour que tu te familiarise avec lui. Quand tu as fini, viens dans la salle de controle me voir pour la suite."
	])
}
if num_cine == 2
{
	compteur ++
	if compteur > 120
	{
		x = 4100
		y = 1300
		num_cine ++
	}
	mp_grid_path(grille, chemin, x, y, 4100, 1300, true)
	path_start(chemin, 9, path_action_stop, false)
	image_angle = point_direction(x, y, path_get_point_x(chemin, 1), path_get_point_y(chemin, 1))
}
if (num_cine == 3)
{
	image_angle = point_direction(x, y, player.x, player.y)
	interagir(not var_pause)
}

if (num_cine == 5)
{
	with (player)
	{
		var chem = path_add()
		mp_grid_path(other.grille, chem, x, y, 3850, 1350, true)
		path_start(chem, 6, path_action_stop, false)
	}
	num_cine ++
	compteur = 0
	global.focus = 10
	cinematique(["Très bien. Dans cette pièce tu pourras accéder à la carte qui te permettra de déplacer le vaisseau vers la planète voulue pour aller l'explorer."])
}
if num_cine == 6 {player.image_angle = point_direction(x, y, other.x, other.y)}
if (num_cine == 7)
{
	pause(true)
	compteur ++
	if compteur > 120
	{
		image_angle += angle_difference(90, image_angle)*0.1
	}
	if compteur > 240
	{
		num_cine ++
		compteur = 0
		cinematique(["...", "On dirait qu'il y a un problème...", "OH NON!! On subit un piratage du vaisseau!!", "Il devait y avoir une faille de sécurité dans le système! Il faut régler ce problème au plus vite!"])
	}
}
if (num_cine == 9)
{
	mp_grid_path(grille, chemin, x, y, 3850, 625, true)
	path_start(chemin, 8, path_action_stop, false)
	image_angle = point_direction(x, y, 3850, 625)
	num_cine ++
}
if (num_cine == 10)
{
	pause(true)
	compteur ++
	if compteur == 30
	{
		with (player)
		{
			var chem = path_add()
			mp_grid_path(other.grille, chem, x, y, 4000, 725, true)
			path_start(chem, 6, path_action_stop, false)
			image_angle = point_direction(x, y, 4000, 725)
		}
	}
	if compteur > 180
	{
		num_cine ++
		compteur = 0
		cinematique(["Encore quelques secondes..."])
	}
}
if (num_cine == 12)
{
	pause(true)
	compteur ++
	if compteur > 240
	{
		num_cine ++
		compteur = 0
		compteur_anim_sol = -1
		vaisseau_0_led.alerte = false
		her_ecran_pirate.visible = false
		cinematique(["...", "J'ai heureusement réussi à bloquer le piratage avant qu'il n'y ait trop de dégats..."])
	}
}
if (num_cine == 13) or (num_cine == 17)
{
	image_angle += angle_difference(point_direction(x, y, player.x, player.y), image_angle)*0.1
}
if (num_cine == 14)
{
	mp_grid_path(grille, chemin, x, y, 3750, 660, true)
	path_start(chemin, 7, path_action_stop, false)
	image_angle = point_direction(x, y, 3750, 660)
	num_cine ++
	cinematique(["Mais certaines données du vaisseau ont été affectées... ", "Je crois que les données de la carte ont été perdues.."])
}
if (num_cine == 16)
{
	pause(true)
	compteur ++
	if compteur > 60
	{
		num_cine ++
		cinematique(["...", "On vient de perdre toutes les données de la carte.", "Il ne reste que la zone alentour du vaisseau.", "Le temps que je répare le système de sécurité, tu pourrais aller sur la planète la plus proche pour voir ce que tu peux faire.", "Peut être que tu pourras récupérer quelque part des données cartographiques pour refaire la carte.", "Toutefois fais attention, à partir d'ici les planètes sont sous controle rebelle, donc les sentinelles adverses t'attaqueront si elle te repère.", "Bonne chance à toi."])
	}
}
if (num_cine == 18)
{
	global.focus = 0
	global.num_animations = 2
	inst_aide = instance_create_depth(x, y, -40, tuto_aide)
	inst_aide.texte = "Pensez à sauvegarder la partie avant de continuer."
	inst_aide.active = true
	num_cine ++
}
if (num_cine == 19)
{
	image_angle += angle_difference(270, image_angle)*0.1
}