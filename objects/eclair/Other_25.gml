if compteur == compteur_max {image_angle = random_range(0, 359)}
set_scale(taille)
part_particles_create(global.part_sys, x, y, part_eclair, 3)

image_angle += -angle_eclair + random_range(0, angle_eclair*2)

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
	a.image_angle = image_angle
	
	
	if irandom_range(0, 10) == 1
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
