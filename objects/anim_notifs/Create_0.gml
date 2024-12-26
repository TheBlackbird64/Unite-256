
compteur = 0
compteur_max = 100
visible = false

if type_obj == "objet" {
	y_camera = 240
	spr = S_item_objets
	image_index = 1
}
if type_obj == "arme" {
	y_camera = 330
	spr = S_item_armes
	image_index = 0
}