if not var_pause
{
	compteur2 --
	compteur = animcurve_channel_evaluate(channel, 1-(compteur2/compteur2_max))
}


if compteur2 == 0 {instance_destroy()}