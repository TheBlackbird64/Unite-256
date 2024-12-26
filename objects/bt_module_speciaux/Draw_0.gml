event_inherited()

compteur_anim ++
if compteur_anim > 60 {compteur_anim = 0}

if module_id % 2 == 0
{
	if active {
		var tab_spr = [S_icone_module_spe_1, S_icone_module_spe_2, S_icone_module_spe_3]
		if global.num_module_spe != module_id and global.num_module_spe != module_id-1 {compteur_anim = 0}
	}
	else
	{
		var tab_spr = [S_icone_module_spe_4, S_icone_module_spe_4, S_icone_module_spe_4]
	}
	draw_sprite_ext(tab_spr[module_id/2 -1], compteur_anim div 30, x-largeur()-cam_sync_sc(10), y+hauteur(), cam_sync_sc(0.15), cam_sync_sc(0.15), 0, c_white, 0.8)
}

if active
{
	draw_text_transformed(x, y+cam_sync_sc(5), string(((module_id-1) % 2) + 1), cam_sync_sc(0.7), cam_sync_sc(0.7), 0)
}
if global.num_module_spe == module_id
{
	if module_id % 2 == 0 {draw_set_all($00FF00, 0.4, -1, -1, -1)}
	else {draw_set_all($FF5000, 0.4, -1, -1, -1)}
	
	draw_rectangle(x-largeur(), y-hauteur(), x+largeur(), y+hauteur(), false)
}
draw_set_alpha(1)