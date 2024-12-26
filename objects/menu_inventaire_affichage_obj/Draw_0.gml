draw_self()
if num_bt+1 <= array_length(global.objets)
{
	draw_sprite_ext(S_item_objets, global.objets[num_bt]-1, x-cam_sync_sc(100), y, image_xscale, image_yscale, 0, c_white, 1)
}