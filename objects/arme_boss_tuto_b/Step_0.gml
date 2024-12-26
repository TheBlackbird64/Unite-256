if not var_pause
{
	image_angle = direction
	var inst = set_effet(effet_feu, 1)
	inst._x = lengthdir_x(sprite_width/2, direction+180)
	inst._y = lengthdir_y(sprite_width/2, direction+180)
	inst.sens = direction+180
	with (inst) {event_user(15)}
	
	if compteur > 0 {compteur --}
	else
	{
		vitesse += 0.15
		speed = vitesse
	}
	portee --
	if portee == 0 {instance_destroy()}
}
else
{
	speed = 0
}