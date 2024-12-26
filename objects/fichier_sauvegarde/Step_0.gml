if verif
{
	if not file_exists("sauvegarde_" + string(num_sauvegarde) + ".txt")
	{
		instance_destroy(bt1)
		instance_destroy(bt2)
		event_user(15)
	}
}