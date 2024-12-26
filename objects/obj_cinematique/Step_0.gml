// creer et detruire
if not detruire
{
	if compteur < compteur_max {compteur ++}
}
else
{
	if compteur > 0 {compteur --}
	else {instance_destroy()}
}

set_scale(cam_sync_sc((compteur/compteur_max)*0.65))

// anim texte
if tab_txt[compteur_cine] != ""
{
	texte_affichage += string_char_at(tab_txt[compteur_cine], 1)
	if string_length(tab_txt[compteur_cine]) > 1
	{
		tab_txt[compteur_cine] = string_copy(tab_txt[compteur_cine], 2, string_length(tab_txt[compteur_cine]))
	}
	else
	{
		tab_txt[compteur_cine] = ""
	}
}
compteur_anim ++
if compteur_anim > compteur_anim_max {compteur_anim = -compteur_anim_max}


// passage texte suivant
if (keyboard_check_pressed(vk_anykey) or (array_length(tab_txt) == 1 and array_length(tab_choix) > 0)) and (compteur_max == compteur)
{
	if array_length(tab_choix) == 0
	{
		if array_length(tab_txt)-1 <= compteur_cine
		{
			event_user(2)
		}
		else
		{
			texte_affichage = ""
			compteur_cine ++
		}
	}
	else
	{
		// choix
		if array_length(tab_txt)-1 > compteur_cine
		{
			compteur_cine ++
			texte_affichage = ""
		}
		if array_length(tab_txt)-1 <= compteur_cine
		{
			if array_length(tab_bt) == 0
			{
				var nb_choix = array_length(tab_choix)
				var sc = cam_sync_sc(0.2)
				var w_bt = sprite_get_width(S_bt_choix_cinematique)
				var ecart = 10
				for (var i = 0; array_length(tab_choix) > i; i++)
				{
					if nb_choix > 4 {nb_choix = 4}
					if i > 3 {nb_choix = array_length(tab_choix)-4}
					
					var bt = create_button(bt_choix_cinematique, sc, x-(nb_choix-1)*((w_bt*sc)+ecart)*0.5 + (w_bt*sc+ecart)*(i mod 4), y+20+50*(i div 4))
					bt.texte = tab_choix[i]
					array_push(tab_bt, bt)
				}
			}
		}
	}
}