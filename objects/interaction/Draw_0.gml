var al = 0.5
if souris_entree {al = 0.8}
draw_sprite_ext(sprite_index, 0, x, y, cam_sync_sc(image_xscale), cam_sync_sc(image_yscale), 0, c_white, al)