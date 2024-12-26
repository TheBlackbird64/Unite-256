create_button(bt_menu_select_module_ok, cam_sync_sc(0.3), x, y+cam_sync_sc(270))
for (var i = 0; array_length(global.nom_armes) > i; i++)
{
	var inst = create_button(bt_select_module, cam_sync_sc(0.27), x-cam_sync_sc(300)+cam_sync_sc(300)*(i%3), y-cam_sync_sc(250)+cam_sync_sc(140)*(i div 3))
	inst.id_module = i+1
}
