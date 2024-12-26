set_scale(0.25)
texte = []
num_cine = -1
compteur = 60
compteur_anim_sol = -1

grille = mp_grid_create(0, 0, round(room_width/60), round(room_height/60), 60, 60)
chemin = path_add()
mp_grid_add_instances(grille, her_murs, true)
