draw_self()

if montrer1 and instance_exists(her_ennemis){
	var a = instance_nearest(player.x, player.y, her_ennemis)
	draw_set_alpha(0.3)
	mp_grid_draw(a.grille)
	draw_path(a.chemin, a.x, a.y, false)
	draw_text(player.x+100, player.y, a.detecte)
}