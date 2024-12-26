visible = false
compteur_max = 15
compteur = compteur_max
duree_max = 30
duree = duree_max
angle_eclair = 50
couleur = $FFFFFF
_direction = -1
_direction_compteur = 0
taille = random_range(0.05*(compteur_max/13), 0.15*(compteur_max/13))

part_eclair = part_type_create() {
part_type_shape(part_eclair, pt_shape_pixel)
part_type_color2(part_eclair, $FFFFFF, $0000FF)
part_type_life(part_eclair, 30, 60)
part_type_alpha2(part_eclair, 1, 0.3)
part_type_size(part_eclair, 1, 3, -0.02, 0)
part_type_direction(part_eclair, 0, 359, 0, 0)
part_type_speed(part_eclair, 1, 3, 0, 0)
part_type_orientation(part_eclair, 0, 359, 10, 0, 0)
}