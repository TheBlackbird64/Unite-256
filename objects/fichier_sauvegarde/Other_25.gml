verif = false
if file_exists("sauvegarde_" + string(num_sauvegarde) + ".txt")
{
	load_local(num_sauvegarde)
	verif = true
	bt1 = create_button(bt_ecran_sauvegarde_jouer, 0.2, x-sprite_width/4, y+sprite_height/4+30)
	bt2 = create_button(bt_ecran_sauvegarde_supprimer, 0.2, x+sprite_width/4, y+sprite_height/4+30)
}
else
{
	create_button(bt_ecran_sauvegarde_creer, 0.3, x, y)
}