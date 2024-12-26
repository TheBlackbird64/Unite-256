if not var_pause
{
	visible = true
	if duree == duree_max {event_user(15)}

	duree--
	if duree <= 0 {instance_destroy()}

	image_alpha = duree/duree_max
	part_type_color2(part_eclair, $FFFFFF, couleur)
}