x = cam_milieu_x()
y = cam_sync_y(630)

draw_self()
if compteur == compteur_max
{
	var temp_texte = texte_affichage
	if compteur_anim > 0 {temp_texte += "_"}
	var taille_txt = 0.7
	draw_set_all(c_white, 1, fa_top, fa_left, F_police_texte)
	draw_text_transformed(x-sprite_width/2+cam_sync_sc(50), y-sprite_height/2+cam_sync_sc(30), saut_ligne_str(temp_texte, 105), cam_sync_sc(taille_txt), cam_sync_sc(taille_txt), 0)
	draw_set_all(c_white, 1, fa_bottom, fa_right, F_police_texte)
	if not ((array_length(tab_txt)-1 <= compteur_cine) and (array_length(tab_choix) != 0))
	{
		draw_text_transformed(x+sprite_width/2-cam_sync_sc(30), y+sprite_height/2-cam_sync_sc(20), "Appuyez sur une touche pour continuer...", cam_sync_sc(taille_txt), cam_sync_sc(taille_txt), 0)
	}
}

