if array_length(global.objets) == 0 {texte = "Vous ne possédez pas d'objets pour l'instant."}
create_button(bt_fen_inventaire_retour, cam_sync_sc(0.3), x, y+hauteur()-cam_sync_sc(80))

var sc = cam_sync_sc(0.3)
var spr_h = sprite_get_height(S_menu_inventaire_affichage_obj)*sc

for (var i = 0; array_length(global.objets) > i; i++)
{
	var _x = -largeur()/2.5
	if i > 4 {_x = -_x}
	
	var _y = -hauteur()+cam_sync_sc(80)
	if i < 5 {_y += i*spr_h}
	else {_y += (i-5)*spr_h}
	
	var inst = instance_create_depth(x+_x, y+_y, depth-1, menu_inventaire_affichage_obj)
	inst.num_bt = i
	inst._parent = id
	with (inst) {set_scale(sc)}
	inst = create_button(bt_fen_inventaire_choisir, sc, x+_x+cam_sync_sc(50), y+_y)
	inst.num_bt = i
	inst.depth = depth-2
	if global.pos_obj_interdis > i
	{
		inst.active = false
	}
}