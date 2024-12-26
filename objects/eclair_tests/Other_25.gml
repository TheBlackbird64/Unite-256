if compteur == compteur_max 
{
	if _direction == -1 {image_angle = random_range(0, 359)}
	else
	{
		image_angle = random_range(_direction-angle_eclair, _direction+angle_eclair)
		_direction_compteur = angle_difference(_direction, image_angle)
	}
}

if _direction == -1 {set_scale(taille)}
else {set_scale(0.1)}

part_particles_create(global.part_sys, x, y, part_eclair, 3)


if _direction == -1 {image_angle += -angle_eclair + random_range(0, angle_eclair*2)}
else
{
	
	var aj = random_range(0, angle_eclair)
	if _direction_compteur < 0
	{
		image_angle -= aj
		_direction_compteur += aj
	}
	else
	{
		image_angle += aj
		_direction_compteur -= aj
	}
	if compteur == 1 {image_angle -= _direction_compteur}
}


if compteur > 0
{
	var decalage_rect_blanc = sprite_get_xoffset(sprite_index)
	decalage_rect_blanc = sprite_width - (sprite_width*(decalage_rect_blanc/sprite_get_width(sprite_index))*2)
	var a = instance_create_depth(x+lengthdir_x(decalage_rect_blanc, image_angle), y+lengthdir_y(decalage_rect_blanc, image_angle), depth, eclair)
	a.compteur = compteur-1
	a.compteur_max = compteur_max
	a.duree_max = duree-1
	a.duree = duree-1
	a.taille = taille
	a.couleur = couleur
	a._direction = _direction
	a._direction_compteur = _direction_compteur
	a.image_angle = image_angle
	
	var aleatoire = 10
	if _direction != -1 {aleatoire = 0}
	if irandom_range(0, aleatoire) == 1
	{
		var decalage_rect_blanc = sprite_get_xoffset(sprite_index)
		decalage_rect_blanc = sprite_width - (sprite_width*(decalage_rect_blanc/sprite_get_width(sprite_index))*2)
		var a = instance_create_depth(x+lengthdir_x(decalage_rect_blanc, image_angle), y+lengthdir_y(decalage_rect_blanc, image_angle), depth, eclair)
		a.compteur_max = irandom_range(1, 5)
		a.compteur = a.compteur_max
		a.duree_max = duree-1
		a.duree = duree-1
		a.couleur = couleur
	}
}
