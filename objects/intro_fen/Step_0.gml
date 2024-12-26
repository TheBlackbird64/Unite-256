// anim texte
if texte2 != ""
{
	texte += string_char_at(texte2, 1)
	if string_length(texte2) > 1
	{
		texte2 = string_copy(texte2, 2, string_length(texte2))
	}
	else
	{
		texte2 = ""
	}
}

compteur_anim ++
if compteur_anim > compteur_anim_max {compteur_anim = -compteur_anim_max}