
if (compteur == 0)
{
	compteur --
	if global.num_animations == 0
	{
		cinematique(["Bienvenu dans ce tutoriel! Commençons par les commandes."])
	}
	else
	{
		cinematique(["Bienvenu dans ce tutoriel! Commençons par les commandes. (Vous ne pouvez pas utiliser d'objets et d'armes qui ne provienne pas du tutoriel, et votre xp est remis à zéro pour le temps du tutoriel.)"])
	}
}
else {compteur --}

if num_cine >= 15 {global.energie = player.energie_max}

// detecter pour lancer cinematique suivante
if num_cine == 1
{
	if player.y < 5700 and not (player.y < 5175)
	{
		x = 375
		y = 5475
		instance_nearest(x, y, her_sys_elec_transmetteur).sys_elec_active = false
		inst_aide.active = false
	}
	if player.y < 5175
	{
		num_cine ++
		instance_nearest(x, y, her_sys_elec_transmetteur).sys_elec_active = true
		cinematique(["Vous pouvez interagir avec certaines choses, comme des boutons par exemple.", "Approchez-vous d'un objet, et si un bouton 'interagir' apparaît, cliquez dessus pour interagir avec cet objet."])
	}
}
if num_cine == 3
{
	if player.x > 1800
	{
		inst_aide.active = false
		num_cine ++
	}
}
if num_cine == 4
{
	if player.x > 2325
	{
		with(instance_nearest(1048, 4207, tuto_bouton1)) {event_user(3)}
		num_cine ++
		cinematique(["Vous pouvez ramasser des pièces et des items. Votre nombre de pièces est affiché en haut.", "Pour accéder à l'inventaire et utiliser des objets, cliquez sur le bouton bleu à gauche."])
	}
}
if num_cine == 6
{
	if player.x > 3750
	{
		inst_aide.active = false
		num_cine ++
	}
}
if num_cine == 7
{
	if player.x > 4200
	{
		with(instance_nearest(3727, 4564, tuto_bouton1)) {event_user(3)}
		num_cine ++
		cinematique(["Pour se défendre des ennemis vous avez des armes. Vous pourrez en trouver d'autres avec différentes caractéristiques au cours du jeu.", "Pour changer d'arme, cliquez sur le bouton rouge à gauche, puis équipez l'arme voulue parmi celles que vous avez trouvés.", "Vous n'avez pas d'armes pour l'instant donc en voici une dans cette salle que vous devrez équiper."])
	}
}
if num_cine == 9
{
	if (player.x > 5300) and (tab_index(global.armes_recup, 1) != -1)
	{
		global.num_arme = 1
		with(tir_player) {event_user(15)}
		inst_aide.active = false
		num_cine ++
		cinematique(["Une fois que vous avez équipé une arme, cliquez avec la souris à l'endroit visé pour tirer.", "Attention, chaque arme dépense plus ou moins d'énergie, donc il ne faut pas tirer inutilement. Vous pouvez voir votre niveau d'énergie en bas à gauche."])
	}
}
if num_cine == 11
{
	if player.y < 4100
	{
		inst_aide.active = false
		num_cine ++
		cinematique(["Vous allez maintenant faire votre premier combat. Le robot qui sera votre adversaire essaiera de vous toucher, et si il y arrive, vous perdez de la vie. Vous pouvez voir votre vie sur la jauge en haut à droite.", "Le combat commence quand vous entrez dans la salle. Par sécurité, votre vie ne peut pas tomber à 0 et votre énergie n'est pas limité dans la salle d'entrainement. Votre but est d'éliminer le robot adverse."])
	}
}
if num_cine == 13
{
	if player.y < 3600
	{
		inst_aide.active = false
		num_cine ++
		var inst = instance_nearest(4900, 3800, her_sys_elec_transmetteur)
		inst.sys_elec_active = true
		cinematique(["Activation du robot de test..."])
		boss_tuto.detect = true
	}
}
if num_cine == 15
{
	if global.vie == 1
	{
		num_cine ++
		boss_tuto.active = false
		boss_tuto.vie2 = boss_tuto.vie
		if instance_exists(her_arme_ennemis) {instance_destroy(her_arme_ennemis)}
		cinematique(["Une erreur s'est produite, vous avez été redirigé vers la mauvaise salle d'entrainement...", "Ce robot était légèrement trop puissant, mais avec de l'entrainement il sera à votre portée (si vous avez BEAUCOUP de patience...).", "Veuillez vous diriger vers la prochaine salle d'entrainement situé en haut (cette fois c'est la bonne normalement)"])
	}
	if boss_tuto.vie == 0
	{
		if instance_exists(her_arme_ennemis) {instance_destroy(her_arme_ennemis)}
		robot_battu = true
		num_cine ++
		if global.num_animations == 0 {global.num_animations ++}
		cinematique(["...", "Remarquable.", "Vous semblez avoir une grande maitrise de votre robot.", "Une récompense vous attend dans le couloir de gauche. Je suppose que vous n'avez plus besoin du tutoriel non?..."])
	}
}
if num_cine == 17
{
	if player.y < 1800
	{
		var inst = instance_nearest(4900, 2300, her_sys_elec_transmetteur)
		inst.sys_elec_active = true
		num_cine ++
		cinematique(["Votre but est d'éliminer le robot de cette salle pour passer à la salle suivante."])
	}
}
if num_cine == 19
{
	if instance_number(ennemi1) == 0
	{
		var inst = instance_nearest(4700, 1900, her_sys_elec_transmetteur)
		inst.sys_elec_active = false
		num_cine ++
	}
}
if num_cine == 20
{
	if player.x < 4500
	{
		num_cine ++
		if global.num_animations == 0 {global.num_animations ++}
		global.vie = nv_xp_vie_max()
		cinematique(["Ce tutoriel est terminé, vous pouvez utiliser le téléporteur pour retourner à votre vaisseau. Il est possible de le recommencer depuis le vaisseau."])
	}
}

