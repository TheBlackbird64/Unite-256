if field_id.saisie != ""
{
	global.nom_sauvegarde = field_id.saisie
	save()
	instance_destroy(_parent)
	transition(R_introduction)
}
else
{
	create_fen_erreur(0.15, 683, 384, "Veillez saisir un nom.")
}