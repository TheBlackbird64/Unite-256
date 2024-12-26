draw_self()

draw_set_color($FF0000)
var haut = hauteur()*0.9
var ecart = haut/5

for (var i = 0; 1 > i; i++)
{
	var _x = x-haut + (compteur/compteur_max)*(haut*2) + i*ecart
	if _x > x+haut {_x -= haut*2}
	
	var _y = sqrt(power(haut, 2) - power((_x-x), 2))
	draw_line(_x, y+_y, _x, y-_y)
}

for (var i = 0; 1 > i; i++)
{
	var _y = y-haut + (compteur/compteur_max)*(haut*2) + i*ecart
	if _y > y+haut {_y -= haut*2}
	
	var _x = sqrt(power(haut, 2) - power((_y-y), 2))
	draw_line(x+_x, _y, x-_x, _y)
}