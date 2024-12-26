x = cam_milieu_x()
y = cam_sync_y(150)
draw_self()

draw_set_all(c_black, image_alpha, fa_middle, fa_center, F_police_texte)
draw_text_transformed(x, y, saut_ligne_str(texte, 70), cam_sync_sc(0.8), cam_sync_sc(0.8), 0)