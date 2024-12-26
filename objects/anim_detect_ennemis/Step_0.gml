if not var_pause
{
	compteur --
	if compteur == -20 {instance_destroy()}
	
	if compteur > 0 {image_yscale = (1-(compteur/compteur_max))*image_xscale}
	else {image_alpha = 1-(compteur/(-20))}
}