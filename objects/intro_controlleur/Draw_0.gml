var sc = 3
draw_set_all(c_white, 1, -1, fa_center, F_police_texte)
draw_rectangle(x-100*sc, y-20, x+100*sc, y+20, true)
draw_set_color(make_color_rgb((abs(compteur_anim)/compteur_anim_max)*200, 255, 0))
draw_rectangle(x-100*sc+2, y-18, x+2-100*sc+(200*sc-4)*(compteur/compteur_max), y+18, false)
draw_set_color(c_white)
draw_text_transformed(x, y+100, string(round(compteur/compteur_max*100)) + "%", 1, 1, 0)

draw_sprite_ext(S_intro_texte, 0, x, y-200, 0.6, 0.6, 0, c_white, abs(compteur_anim/compteur_anim_max)*1.2)