if not var_pause
{
	image_angle = direction
	speed = vitesse
	portee --
	if portee == 0
	{
		instance_destroy()
	}
}
else
{
	speed = 0
}