var ecart = 20
for (var i = 0; 1366 > i*ecart; i++)
{
	for (var j = 0; 768 > j*ecart; j++)
	{
		instance_create_depth(i*ecart, j*ecart, depth+1, intro_fond_ecran_binaire)
	}
}

texte2 = "Démarrage du système en cours..."
compteur_anim_max = 20
compteur_anim = compteur_anim_max

create_button(intro_bt_suivant, 0.5, x+270, y+210)