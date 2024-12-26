event_inherited()

draw_set_all(c_black)
if array_length(global.objets) != 0
{
	draw_rectangle(x-cam_sync_sc(3), y-hauteur()+cam_sync_sc(30), x+cam_sync_sc(3), y+hauteur()-cam_sync_sc(150), false)
}
