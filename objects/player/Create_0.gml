event_inherited()

v_acceleration = 0
h_acceleration = 0
coef_acceleration = 0.08
coef_ralentissement = 0.08
vitesse_rotation = 180
vitesse_base = 7
vitesse = vitesse_base

vie_max = nv_xp_vie_max()
energie_max = nv_xp_energie_max()
energie_module_spe_max = 1000
energie_module_spe = energie_module_spe_max

set_scale(0.15)
instance_create_depth(0, 0, -45, tir_player)
instance_create_depth(0, 0, -45, obj_camera)
instance_create_depth(0, 0, -45, affichage_player)

