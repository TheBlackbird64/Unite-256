draw_self()
if debug.active and debug.montrer2
{
	draw_reset_all()
	draw_text(x+50, y, string(sys_elec_active))
	draw_set_color(c_red)
	draw_circle(x, y, sys_elec_rayon_detection, true)
	draw_set_color(c_white)
}