function create_button(button, scale, _x, _y)
{
	var scale2 = scale
	if scale2 == -1 {scale2 = 0.35}
	var inst = instance_create_depth(_x, _y, depth-1, button)
	with(inst) {set_scale(scale2)}
	inst._parent = id
	if global.focus >= 1000 {inst.focus = 0}
	else {inst.focus = global.focus}
	
	return inst
}

function create_field(scale, _x, _y, button)
{
	var scale2 = scale
	if scale2 == -1 {scale2 = 0.35}
	var inst = instance_create_depth(_x, _y, depth-1, champs_texte)
	with(inst) {set_scale(scale2)}
	inst._parent = id
	if global.focus >= 1000 {inst.focus = 0}
	else {inst.focus = global.focus}
	button.field_id = inst
	
	return inst
}

function create_window(window, scale, _x, _y)
{
	global.focus++
	instance_create_depth(_x, _y, depth-1, window, 
	{
		image_xscale: scale,
		image_yscale: scale
	})
}

function create_fen_erreur(scale, _x, _y, texte)
{
	global.focus++
	var inst = instance_create_depth(_x, _y, depth-1, fen_erreur, 
	{
		image_xscale: scale,
		image_yscale: scale
	})
	inst.texte = texte
}

function create_bt_close()
{
	create_button(bt_fermer, cam_sync_sc(0.15), x+largeur()-cam_sync_sc(50), y-hauteur()+cam_sync_sc(50))
}

function creer_bouton_jeu()
{
	array_push(global.tab_id_boutons, instance_create_depth(0, 0, -50, bt_menu_pause))
	array_push(global.tab_id_boutons, instance_create_depth(0, 0, -50, bt_menu_inventaire))
	array_push(global.tab_id_boutons, instance_create_depth(0, 0, -50, bt_menu_home))
	array_push(global.tab_id_boutons, instance_create_depth(0, 0, -50, bt_menu_select_module))
	for (var i = 1; 7 > i; i++)
	{
		array_push(global.tab_id_boutons, instance_create_depth(0, 0, -50, bt_module_speciaux, {module_id : i}))
	}
}
