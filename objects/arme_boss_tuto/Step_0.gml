if not var_pause
{
	speed = vitesse
	image_angle += 10
	portee --
	if portee == 0 {instance_destroy()}
}
else
{
	speed = 0
}