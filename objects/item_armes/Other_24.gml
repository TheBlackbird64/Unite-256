///@description event ramasser
if tab_index(global.armes_recup, string(num_arme)) == -1
{
	array_push(global.armes_recup, string(num_arme))
}
anim_notification("arme", num_arme-1)