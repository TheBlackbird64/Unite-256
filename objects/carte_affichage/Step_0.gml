
compteur ++
if compteur > compteur_max/2 {image_alpha = (compteur_max-compteur)/(compteur_max/2)}
else {image_alpha = 1}

if image_alpha <= 0 {instance_destroy()}

if collision_point(mouse_x, mouse_y, id, false, false)
{
	compteur = 0
}