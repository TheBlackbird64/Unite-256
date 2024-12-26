

// fond affichage haut/bas (pour éviter qu'on voit pas les écritures sur fond blanc)
draw_set_all(c_white, 0.5, fa_middle, fa_left, F_police_texte)
draw_sprite_ext(S_affichage_player_fond, 0, cam_sync_x(683), cam_sync_y(0), cam_sync_sc(1), cam_sync_sc(1), 0, c_white, 0.5)
draw_sprite_ext(S_affichage_player_fond, 0, cam_sync_x(1630), cam_sync_y(768), cam_sync_sc(-1), cam_sync_sc(-1.5), 0, c_white, 0.5)
draw_sprite_ext(S_affichage_player_fond, 0, cam_sync_x(-500), cam_sync_y(768), cam_sync_sc(-1), cam_sync_sc(-1.5), 0, c_white, 0.5)
draw_set_alpha(1)

// pieces
draw_sprite_ext(S_affichage_player_pieces, 0, cam_sync_x(250), cam_sync_y(50), cam_sync_sc(0.2), cam_sync_sc(0.2), 0, c_white, 1)
draw_text_transformed(cam_sync_x(275), cam_sync_y(50), "Pièces:", cam_sync_sc(1), cam_sync_sc(1), 0)
draw_text_transformed(cam_sync_x(360), cam_sync_y(50), global.pieces, cam_sync_sc(1), cam_sync_sc(1), 0)

// xp
draw_rectangle(cam_sync_x(515), cam_sync_y(30), cam_sync_x(815), cam_sync_y(70), true)

if not (get_xp(false, true, global.xp) == "niveau max.") {
	var temp_x2 = cam_sync_x(517+296*get_xp(false, false, global.xp)/global.tab_nv[get_xp(true, true, global.xp)-1])
}
else {var temp_x2 = cam_sync_x(517)}
draw_rectangle_color(cam_sync_x(517), cam_sync_y(32), temp_x2, cam_sync_y(68), $FF0000, $FF89C9, $FF89C9, $FF0000, false)
draw_set_color(c_white)
draw_set_all(c_white, 1, fa_middle, fa_center, F_police_texte)
draw_text_transformed(cam_sync_x(665), cam_sync_y(50), "xp: " + get_xp(false, true, global.xp), cam_sync_sc(1), cam_sync_sc(1), 0)

draw_sprite_ext(S_affichage_player_xp, 0, cam_sync_x(505), cam_sync_y(45), cam_sync_sc(0.2), cam_sync_sc(0.2), 0, c_white, 1)
draw_text_transformed(cam_sync_x(505), cam_sync_y(50), get_xp(true, true, global.xp), cam_sync_sc(1), cam_sync_sc(1), 0)

// vie
draw_rectangle(cam_sync_x(950), cam_sync_y(30), cam_sync_x(1320), cam_sync_y(70), true)
draw_rectangle_color(cam_sync_x(952), cam_sync_y(32), cam_sync_x(952+366*(global.vie/player.vie_max)), cam_sync_y(68), $00FF00, $A6FFA6, $A6FFA6, $00FF00, false)
draw_sprite_ext(S_affichage_player_vie, 0, cam_sync_x(940), cam_sync_y(50), cam_sync_sc(0.3), cam_sync_sc(0.3), 0, c_white, 1)
draw_sprite_ext(S_affichage_player_vie, 0, cam_sync_x(940), cam_sync_y(50), cam_sync_sc(0.28), cam_sync_sc(0.28), 0, $0000FF, 1)
draw_text_transformed(cam_sync_x(1135), cam_sync_y(50), "vie: " + string(global.vie) + "/" + string(player.vie_max), cam_sync_sc(1), cam_sync_sc(1), 0)


// energie
draw_rectangle(cam_sync_x(25), cam_sync_y(755), cam_sync_x(50), cam_sync_y(455), true)
draw_rectangle_color(cam_sync_x(27), cam_sync_y(753), cam_sync_x(48), cam_sync_y(753-296*(global.energie/player.energie_max)), $94F9FF, $94F9FF, $00F0FF, $00F0FF, false)
draw_sprite_ext(S_affichage_player_energie, 0, cam_sync_x(37), cam_sync_y(435), cam_sync_sc(0.3), cam_sync_sc(0.3), 0, c_white, 1)
draw_set_all(c_white, 1, fa_bottom, fa_left, F_police_texte)
draw_text_transformed(cam_sync_x(60), cam_sync_y(755), "energie: \n" + string(global.energie) + "/" + string(player.energie_max), cam_sync_sc(0.8), cam_sync_sc(0.8), 0)

// recharge
draw_text_transformed(cam_sync_x(1060), cam_sync_y(767), "recharge: ", cam_sync_sc(0.8), cam_sync_sc(0.8), 0)
draw_rectangle(cam_sync_x(1160), cam_sync_y(735), cam_sync_x(1360), cam_sync_y(760), true)
if tir_player.recharge == tir_player.recharge_max {draw_set_color($00FF00)}
else {draw_set_color($0000FF)}
draw_rectangle(cam_sync_x(1162), cam_sync_y(737), cam_sync_x(1162 + 196*(tir_player.recharge/tir_player.recharge_max)), cam_sync_y(758), false)

// energie module spéciaux
var aj = 50
draw_set_color($FFFFFF)
draw_text_transformed(cam_sync_x(990), cam_sync_y(667+aj), "énergie spéciale: ", cam_sync_sc(0.8), cam_sync_sc(0.8), 0)
draw_rectangle(cam_sync_x(1160), cam_sync_y(635+aj), cam_sync_x(1360), cam_sync_y(660+aj), true)
if player.energie_module_spe == player.energie_module_spe_max {draw_set_color($FF00AA)}
else {draw_set_color($FFE400)}
draw_rectangle(cam_sync_x(1162), cam_sync_y(637+aj), cam_sync_x(1162 + 196*(player.energie_module_spe/player.energie_module_spe_max)), cam_sync_y(658+aj), false)

// liste effets objets en cours d'utilisation
draw_set_all(c_white, 1, fa_middle, -1, F_police_texte)
for (var i = 0; array_length(liste_id_obj) > i; i++)
{
	var in = liste_id_obj[i]
	var sc = 0.3
	var haut = sprite_get_height(S_item_objets)*sc
	draw_sprite_ext(S_item_objets, in.id_obj-1, cam_sync_x(1260), cam_sync_y(100+haut*i), cam_sync_sc(sc), cam_sync_sc(sc), 0, c_white, 1)
	draw_text_transformed(cam_sync_x(1300), cam_sync_y(100+haut*i), string(in.compteur/60), cam_sync_sc(0.8), cam_sync_sc(0.8), 0)
}