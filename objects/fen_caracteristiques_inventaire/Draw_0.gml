draw_self()
set_scale(cam_sync_sc(0.3))

draw_set_all(c_white, image_alpha, fa_left, fa_top, F_police_texte)
var _x = -largeur()+cam_sync_sc(20)
var _y = cam_sync_sc(25)
var _y_base = y+cam_sync_sc(45)
var _sc = cam_sync_sc(0.6)
var compteur_ligne = 0
var tab_stats_temp = ["vie", "defense", "energie", "degats", "compteur", "texte"]
var tab_noms_temp = ["vie : + ", "défense : + ", "énergie : + ", "dégats : + ", "durée : ", ""]

for (var i = 0; array_length(tab_stats_temp) > i; i++)
{
	var temp_contenu = stats_modules_objets(id_module, tab_stats_temp[i])
	if temp_contenu != 0
	{
		if tab_noms_temp[i] == "durée : " {temp_contenu = string(temp_contenu/60) + " secondes"}
		draw_text_transformed(x+_x, _y_base+_y*compteur_ligne, tab_noms_temp[i] + string(temp_contenu), _sc, _sc, 0)
		compteur_ligne ++
	}
}


draw_set_alpha(1)