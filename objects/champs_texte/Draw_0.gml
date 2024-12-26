draw_self()
draw_set_all(c_white, 1, fa_middle, fa_left, F_police_texte)


if active
{
	if compteur >= 30 {draw_text(x-sprite_width/2+10, y, saisie + "|")}
	else {draw_text(x-sprite_width/2+10, y, saisie)}
}
else
{
	if saisie != "" {draw_text(x-sprite_width/2+10, y, saisie)}
	else {draw_text(x-sprite_width/2+10, y, texte)}
}