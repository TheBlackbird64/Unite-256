var col = make_color_rgb(255-(compteur-200), 0, 0)
if compteur-200 < 0 {col = c_red}
if compteur-200 > 255 {col = c_black}

draw_set_all(col, compteur/compteur_max, fa_middle, fa_center, F_police_texte)
draw_rectangle(0, 0, room_width, room_height, false)

if compteur > 150
{
	col = make_color_rgb((compteur-200), 0, 0)
	if compteur-200 < 0 {col = c_black}
	if compteur-200 > 255 {col = c_red}
	
	draw_set_color(col)
	draw_text_transformed(cam_milieu_x(), cam_milieu_y(), string_copy(texte, 1, (compteur-150) div 10), 6, 6, 0)
}