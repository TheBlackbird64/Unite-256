if not var_pause
{
	compteur ++
	if compteur > compteur_max {compteur = -compteur_max}
	y = _y + animcurve_channel_evaluate(channel, abs(compteur)/compteur_max)*25
}