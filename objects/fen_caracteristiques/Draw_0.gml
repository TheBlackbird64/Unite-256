draw_self()
set_scale(cam_sync_sc(0.25))

draw_set_all(c_white, image_alpha, fa_left, fa_top, F_police_texte)
var _x = -sprite_width/2+cam_sync_sc(5)
var _y = cam_sync_sc(25)
var _y_base = y+cam_sync_sc(30)
var _sc = cam_sync_sc(0.6)
draw_text_transformed(x+_x, _y_base, "dégats: " + string(stats_modules_attaque(string(id_module), "degats")), _sc, _sc, 0)
draw_text_transformed(x+_x, _y_base+_y*1, "portée: " + string(stats_modules_attaque(string(id_module), "portee")*stats_modules_attaque(string(id_module), "vitesse")), _sc, _sc, 0)
draw_text_transformed(x+_x, _y_base+_y*2, "dépense énergie par tir: " + string(stats_modules_attaque(string(id_module), "depense_energie")), _sc, _sc, 0)
draw_text_transformed(x+_x, _y_base+_y*3, "recharge: " + string(stats_modules_attaque(string(id_module), "recharge")), _sc, _sc, 0)
draw_text_transformed(x+_x, _y_base+_y*4, "vitesse: " + string(stats_modules_attaque(string(id_module), "vitesse")), _sc, _sc, 0)

draw_set_alpha(1)