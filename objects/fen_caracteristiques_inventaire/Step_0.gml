if not instance_exists(_parent) {instance_destroy()}

if collision_point(mouse_x, mouse_y, _parent, false, true)
{
	if compteur < 10 {compteur++}
}
else
{
	if compteur > 0 {compteur--}
}


image_alpha = (compteur/10)*0.9
visible = true