var _x = (compteur/compteur_max)
if compteur > compteur_max {_x = 1}
x = cam_sync_x(0) + (sprite_width-cam_sync_sc(80))*_x
y = cam_sync_y(y_camera)
draw_self()

var taille = 0.08
if spr == S_item_objets {taille = 0.3}
draw_sprite_ext(spr, num, x-0.18*(sprite_width), y, cam_sync_sc(taille), cam_sync_sc(taille), 0, c_white, image_alpha)