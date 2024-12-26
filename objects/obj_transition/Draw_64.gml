var taille_carre = sprite_get_width(S_transition)
for (var i = 0; 1366 > i*taille_carre; i++)
{
	for (var j = 0; 768 > j*taille_carre; j++)
	{
		var a = ((1366-i*taille_carre)/1366)
		if a > 1 {a = 1}
		var b = ((768-j*taille_carre)/768)
		if b > 1 {b = 1}
		var sc = q*(1+a*2+b*2)
		
		if sc > 0.5
		{
			draw_sprite_ext(S_transition, 0, 25+i*taille_carre, 25+j*taille_carre, (sc-0.5)*2, (sc-0.5)*2, 0, col, 1)
		}
	}
}