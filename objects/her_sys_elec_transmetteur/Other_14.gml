
if sys_elec_active {
	var liste = ds_list_create()
	collision_circle_list(x, y, sys_elec_rayon_detection, her_sys_elec_transmetteur, false, true, liste, false)
	collision_circle_list(x, y, sys_elec_rayon_detection, her_sys_elec_depense_energie, false, true, liste, false)
	var tab = liste_vers_tab(liste)
	
	array_push(sys_elec_id_transmission.sys_elec_liste_reseau, id)
	for (var i = 0; i < array_length(tab); i++)
	{
		if tab_index(sys_elec_id_transmission.sys_elec_liste_reseau, tab[i].id) == -1
		{
			tab[i].sys_elec_id_transmission = sys_elec_id_transmission
			with (tab[i]) {event_user(4)}
		}
	}
	
	
	// particules
	collision_circle_list(x, y, sys_elec_rayon_detection, her_sys_elec_generateur, false, true, liste, false)
	var tab = liste_vers_tab(liste)
	for (var i = 0; i < array_length(tab); i++)
	{
		part_emitter_region(global.part_sys, part_emit, x, tab[i].x, y, tab[i].y, ps_shape_line, ps_distr_linear)
		part_emitter_burst(global.part_sys, part_emit, part_energie, 1)
		//part_emitter_burst(global.part_sys, part_emit, part_energie2, 1)
		part_emitter_burst(global.part_sys, part_emit, part_energie3, (point_distance(x, y, tab[i].x, tab[i].y)/sys_elec_rayon_detection)*100)
	}
	
	ds_list_destroy(liste)
}