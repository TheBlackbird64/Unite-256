/*
comme on peut bouger sur la carte, on pourrait superposer un bouton 'jouer' et un autre bouton 
pour appuyer les 2 en même temps, donc pour éviter ce bug on met global.focus = 1 pour qu'il soit
le seul bouton actif (son focus est mis à 1 dans la fenetre d'affichage
*/

if collision_point(mouse_x, mouse_y, id, false, false)
{
	global.focus = 1
}
else {global.focus = 0}

image_alpha = _parent.image_alpha

if dernier_nv_fini()+1 >= num_niveau
{
	active = true
}