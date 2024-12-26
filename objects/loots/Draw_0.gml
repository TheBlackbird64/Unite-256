var alpha = 1
var sc = 0.16
var sc_txt = 1.2
var ajout_y = -100
var coef = 80
if compteur2 < 60 {alpha = compteur2/60}

draw_reset_all()
draw_set_alpha(alpha)
draw_set_font(F_police_texte)

if nb_pieces > 0
{
	draw_sprite_ext(S_affichage_player_pieces, 0, x, y-compteur*coef+ajout_y, cam_sync_sc(sc), cam_sync_sc(sc), 0, c_white, alpha)
	draw_text_transformed(x+30, y-compteur*coef+ajout_y, "+" + string(nb_pieces), cam_sync_sc(sc_txt), cam_sync_sc(sc_txt), 0)
}

if nb_xp > 0
{
	draw_sprite_ext(S_affichage_player_xp, 0, x, y-compteur*coef+60+ajout_y, cam_sync_sc(sc), cam_sync_sc(sc), 0, c_white, alpha)
	draw_text_transformed(x+30, y-compteur*coef+60+ajout_y, "+" + string(nb_pieces), cam_sync_sc(sc_txt), cam_sync_sc(sc_txt), 0)
}