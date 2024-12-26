if not instance_exists(_parent) {instance_destroy()}
else
{
	draw_sprite_ext(_parent.sprite_index, 1, _parent.x, _parent.y, _parent.image_xscale, _parent.image_yscale, _parent.image_angle, couleur, compteur/compteur_max)
}