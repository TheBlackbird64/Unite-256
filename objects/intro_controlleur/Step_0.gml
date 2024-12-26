if compteur2 > 0 {compteur2--}

if compteur2 == 0 and compteur < compteur_max
{
	compteur ++
}

if compteur == compteur_max
{
	compteur2 += 2
	if compteur2 == compteur2_max
	{
		instance_create_depth(x, y, -20, intro_fen)
		instance_destroy()
	}
}

compteur_anim --
if compteur_anim < -compteur_anim_max {compteur_anim = compteur_anim_max}


//debug
if debug.active {compteur = compteur_max}