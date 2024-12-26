
if active {image_index = 2}
else
{
	compteur ++
	if compteur > 30 {compteur = -30}
	if compteur > 0 {image_index = 0}
	else {image_index = 1}
}

interagir(not var_pause)