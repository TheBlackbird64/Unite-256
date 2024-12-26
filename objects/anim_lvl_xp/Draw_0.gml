
draw_set_all(c_black, 0.5, fa_middle, fa_center, F_police_texte)
draw_rectangle(0, 0, room_width, room_height, false)
draw_self()
draw_set_alpha(1)
draw_text_transformed(x, y, string(get_xp(true, false, global.xp)), 1.2, 1.2, 0)
draw_set_color(c_white)
draw_text_transformed(x, y+100, "Niveau suivant!", 1.5, 1.5, 0)