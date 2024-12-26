x = inst.x
y = inst.y

compteur ++
if compteur > compteur_max {compteur = 0}

compteur2 --
if compteur2 < 0 {compteur2 = 0}
if mouse_check_button(mb_left) {compteur2 = compteur_max2}