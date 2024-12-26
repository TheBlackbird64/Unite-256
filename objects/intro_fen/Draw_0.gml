draw_set_all(c_black, 0.5, -1, -1, F_police_texte)
draw_self()
draw_set_alpha(1)
draw_set_color(c_white)
if compteur_anim >= 0
{
	draw_text_transformed(x-largeur()+15, y-hauteur()+decalage_texte, saut_ligne_str(texte, saut_ligne_carac), cam_sync_sc(0.8), cam_sync_sc(0.8), 0)
}
else
{
	draw_text_transformed(x-largeur()+15, y-hauteur()+decalage_texte, saut_ligne_str(texte+"__", saut_ligne_carac), cam_sync_sc(0.8), cam_sync_sc(0.8), 0)
}