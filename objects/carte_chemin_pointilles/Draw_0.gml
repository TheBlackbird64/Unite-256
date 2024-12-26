
var sc = 0.1
var taille = (sprite_width*sc)

for (var i = 0; point_distance(x, y, inst2.x, inst2.y)/taille > i; i++)
{
	var dir = point_direction(x, y, inst2.x, inst2.y)
	var taille2 = taille*i + taille*(compteur/compteur_max)
	draw_sprite_ext(sprite_index, 0, x+lengthdir_x(taille2, dir), y+lengthdir_y(taille2, dir), sc, sc, dir, c_white, compteur2/(compteur_max2/2))
}