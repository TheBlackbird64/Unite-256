draw_self()
if file_exists("sauvegarde_" + string(num_sauvegarde) + ".txt") and variable_instance_exists(id, "nom_sauvegarde")
{
	draw_set_all(c_black, 1, fa_middle, fa_center, F_police_texte)
	draw_text_transformed(x, y-100, nom_sauvegarde, 1, 1, 0)
	draw_line_width(x-sprite_width/2+20, y-80, x+sprite_width/2-20, y-80, 3)
	
	draw_set_all(c_black, 1, fa_middle, fa_left, F_police_texte)
	var _x = x-sprite_width/2+20
	var sc = 0.8
	draw_text_transformed(_x, y-50, "Nombre de niveaux terminés: " + string(array_length(niveau_termines)), sc, sc, 0)
	draw_text_transformed(_x, y-20, "Niveau en xp: " + string(get_xp(true, false, xp)), sc, sc, 0)
	draw_text_transformed(_x, y+10, "Pièces récoltées: " + string(pieces), sc, sc, 0)
	draw_text_transformed(_x, y+40, "Modules spéciaux trouvés: " + string(array_length(module_spe_debloques)), sc, sc, 0)
}