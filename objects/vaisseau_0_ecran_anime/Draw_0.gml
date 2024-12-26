draw_self()

if (image_angle == 0) or (image_angle == 180)
{
	for (var i = 0; array_length(liste_lignes) > i; i++)
	{
		draw_sprite_ext(S_vaisseau_0_ecran_anime2, 0, x-largeur()+5, y-hauteur()+5+i*(15*image_xscale), image_xscale*(liste_lignes[i]/7), image_yscale, image_angle, col, 1)
	}
}
else
{
	for (var i = 0; array_length(liste_lignes) > i; i++)
	{
		draw_sprite_ext(S_vaisseau_0_ecran_anime2, 0, x+hauteur()-5-i*(15*image_xscale), y-largeur()+5, image_xscale*(liste_lignes[i]/7), image_yscale, image_angle, col, 1)
	}
}