pause(true)
player.vie_max = nv_xp_vie_max()
player.energie_max = nv_xp_energie_max()
//global.vie = player.vie_max
//global.energie = player.energie_max

set_scale(cam_sync_sc(0.5))
_y = y
compteur_max = 120
compteur = 0
channel = animcurve_get_channel(AnimationCurve_anim_lvl_xp, "courbe1")

part_1 = part_type_create()
part_type_sprite(part_1, S_affichage_player_xp, 0, 0, 0)
//part_type_color2(part_1, $FFFFFF, $FFDC00)
part_type_direction(part_1, 0, 180, 0, 0)
part_type_gravity(part_1, 0.2, 270)
part_type_speed(part_1, 6, 12, 0, 0)
part_type_life(part_1, 45, 90)
part_type_alpha2(part_1, 1, 0.75)
part_type_size(part_1, 0.01, 0.1, 0, 0)

part_sys = part_system_create()
part_system_depth(part_sys, depth-10)