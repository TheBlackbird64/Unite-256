num_cine ++
if num_cine == 1
{
	inst_aide.texte = "Utilisez " + global.touche_haut[1] + " pour aller vers le haut, " + global.touche_bas[1] + " pour le bas, " + global.touche_gauche[1] + " pour la gauche, et " + global.touche_droite[1] + " pour aller à droite. Approchez-vous de la porte pour continuer."
	inst_aide.active = true
}
if num_cine == 3
{
	var porte = instance_nearest(x, y, tuto_porte)
	porte.x = porte._x
	porte.y = porte._y
	inst_aide.texte = "Ouvrez la porte suivante à l'aide du bouton pour continuer."
	inst_aide.active = true
}
if num_cine == 6
{
	var porte = instance_nearest(2025, 4630, tuto_porte)
	porte.x = porte._x
	porte.y = porte._y
	inst_aide.texte = "Ramassez les items dans la pièce. Ensuite vous pouvez continuez en appuyant sur le bouton pour sortir."
	inst_aide.active = true
}
if num_cine == 9
{
	var porte = instance_nearest(4000, 4785, tuto_porte)
	porte.x = porte._x
	porte.y = porte._y
	inst_aide.texte = "Récupérez l'arme et équipez-la dans le menu pour continuer."
	inst_aide.active = true
}
if num_cine == 13
{
	var inst = instance_nearest(4900, 3800, her_sys_elec_transmetteur)
	inst.sys_elec_active = false
}
if num_cine == 15
{
	var porte = instance_nearest(5400, 4000, tuto_porte)
	porte.x = porte._x
	porte.y = porte._y
}
if num_cine == 17
{
	if boss_tuto.vie != 0
	{
		global.vie = nv_xp_vie_max()
		var inst = instance_nearest(4900, 2300, her_sys_elec_transmetteur)
		inst.sys_elec_active = false
	}
	if robot_battu
	{
		var inst = instance_nearest(4530, 2450, her_sys_elec_transmetteur)
		inst.sys_elec_active = false
		num_cine = 100
		with (boss_tuto) {loot(x, y, 100, 0)}
	}
}
if num_cine == 19
{
	var porte = instance_nearest(5500, 2300, tuto_porte)
	porte.x = porte._x
	porte.y = porte._y
}