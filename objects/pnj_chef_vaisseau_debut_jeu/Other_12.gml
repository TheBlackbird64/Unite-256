num_cine ++

if (num_cine == 4)
{
	if reponse_cinematique == "Non" {num_cine--}
	if reponse_cinematique == "Oui" {num_cine++}
}
if num_cine == 7 {
	compteur_anim_sol = 0
	vaisseau_0_led.alerte = true
	her_ecran_pirate.visible = true
}