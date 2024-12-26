draw_self()

draw_set_all(c_black, 1, fa_top, fa_center, F_police_texte)
draw_text_transformed(x, y-640*image_yscale, texte, 0.8, 0.8, 0)
draw_line(x-largeur()*0.9, y-545*image_yscale, x+largeur()*0.9, y-545*image_yscale)
draw_text_transformed(x, y-540*image_yscale, saut_ligne_str(texte_description, 38), 0.6, 0.6, 0)