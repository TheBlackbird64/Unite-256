if global.defense_ajoutee == defense {global.defense_ajoutee = 0}
global.attaque_ajoutee -= degats

if instance_exists(player)
{
	array_delete(affichage_player.liste_id_obj, tab_index(affichage_player.liste_id_obj, id), 1)
}