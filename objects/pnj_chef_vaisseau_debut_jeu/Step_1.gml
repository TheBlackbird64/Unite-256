//animations

if compteur_anim_sol > -1 {compteur_anim_sol ++}
if compteur_anim_sol > 60 {compteur_anim_sol = 0}
layer_set_visible(layer_get_id("Tiles_sol_rouge"), (compteur_anim_sol > 30))