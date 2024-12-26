scale = 0.15
set_scale(cam_sync_sc(scale))
x_camera = 1320
y_camera = 350 + module_id*sprite_height + ((module_id-1) div 2)*20


active = tab_index(global.module_spe_debloques, string(module_id)) != -1


compteur_anim = 0