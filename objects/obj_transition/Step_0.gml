if compteur != 0 {compteur--}
else
{
	compteur2 --
	if compteur2 == 0 {compteur--}
}


if compteur == -60 {instance_destroy()}
if (compteur == 1) and (_room_ != -1) {
	pause(false)
	if _room_ != -1 {room = _room_}
}

q = (compteur_max-abs(compteur))/compteur_max
col = make_color_rgb(255*(1-q), 255*(1-q), 255*(1-q))