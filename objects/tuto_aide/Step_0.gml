if active
{
	if compteur < compteur_max {compteur ++}
}
else
{
	if compteur > 0 {compteur --}
}

image_alpha = (compteur/compteur_max)*0.75
set_scale(cam_sync_sc(1))