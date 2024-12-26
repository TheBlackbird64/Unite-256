
if not var_pause
{
	//debug
	if collision_point(mouse_x, mouse_y, id, false, false) and mouse_check_button_pressed(mb_left)
	{
		sys_elec_active = not sys_elec_active
	}
	
	if sys_elec_active
	{
		sys_elec_energie = sys_elec_energie_produite
		sys_elec_liste_reseau = []
		// désactivation auto des her_depense_energie qui ont été connecté en dernier à ce générateur 
		// pour prendre en charge le mouvement et le manque d'énergie
		with (her_sys_elec_depense_energie)
		{
			if sys_elec_id_transmission == other.id {sys_elec_energie = false}
		}
		
		// transmission message energie
		var liste = ds_list_create()
		collision_circle_list(x, y, sys_elec_rayon_detection, her_sys_elec_transmetteur, false, true, liste, false)
		var tab = liste_vers_tab(liste)
		
		for (var i = 0; i < array_length(tab); i++)
		{
			tab[i].sys_elec_id_transmission = id
			with (tab[i]) {event_user(4)}
		}
		
		// qte energie
		for (var i = 0; i < array_length(sys_elec_liste_reseau); i++)
		{
			if variable_instance_exists(sys_elec_liste_reseau[i], "sys_elec_depense_energie")
			{
				if sys_elec_energie >= sys_elec_liste_reseau[i].sys_elec_depense_energie
				{
					sys_elec_energie -= sys_elec_liste_reseau[i].sys_elec_depense_energie
					sys_elec_liste_reseau[i].sys_elec_energie = true
				}
				else
				{
					sys_elec_liste_reseau[i].sys_elec_energie = false
				}
			}
		}
		ds_list_destroy(liste)
	}
	else
	{
		with (her_sys_elec_depense_energie)
		{
			if sys_elec_id_transmission == other.id {sys_elec_energie = false}
		}
	}
}

