if compteur < compteur_max {compteur ++}
else {compteur = -compteur_max}

if compteur < 0
{
	deplacer_mur(x+_x, y+_y)
}
else
{
	deplacer_mur(x-_x, y-_y)
}