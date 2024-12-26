
if active
{
	draw_reset_all()
	debug_ligne(true)
	var _x = 50
	draw_text(_x, debug_ligne(false), "debug mode")
	draw_text(_x, debug_ligne(false), "fps: " + string(fps))
	draw_text(_x, debug_ligne(false), "invincible: " + string(invincible))
	
	//draw_text(_x, debug_ligne(false), regrouper(global.room_save, ";"))
	//draw_text(_x, debug_ligne(false), regrouper(global.niveau_termines, ";"))
	draw_text(_x, debug_ligne(false), "num cinematique: " + string(global.num_animations))
	draw_text(_x, debug_ligne(false), "zoom: " + string(get_zoom()))
	draw_text(_x, debug_ligne(false), "focus: " + string(global.focus))
	//draw_text(_x, debug_ligne(false), string(keyboard_key))
	//draw_text(_x, debug_ligne(false), string(chr(keyboard_key)))
	
	
	try {
	//draw_text(_x, debug_ligne(false), regrouper(obj_cinematique.tab_bt, ";"))
	//draw_text(_x, debug_ligne(false), regrouper(obj_cinematique.tab_choix, ";"))
	
	} catch(e) {}
}