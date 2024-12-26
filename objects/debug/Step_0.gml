

//if keyboard_check_pressed(vk_numpad0) {active = not active}
visible = active

if active
{
	if keyboard_check(vk_control)
	{
		if keyboard_check_pressed(vk_subtract) {set_zoom(get_zoom()*1.2)}
		if keyboard_check_pressed(vk_add) {set_zoom(get_zoom()/1.2)}
	}
	else
	{
		if keyboard_check(vk_add) {loot(player.x, player.y, 0, 10)}
		if keyboard_check(vk_subtract) {global.xp -= 10}
	}
	
	if keyboard_check_pressed(vk_numpad1) {montrer2 = not montrer2} //electricité
	if keyboard_check_pressed(vk_numpad2) {montrer1 = not montrer1} // ennemis deplacements
	if keyboard_check_pressed(vk_numpad3) {explosion(mouse_x, mouse_y, 20, 3)}
	if keyboard_check_pressed(vk_numpad4) {show_message("sauvegardé") save()} // sauvegarde
	if keyboard_check_pressed(vk_numpad5) {pause(not var_pause)} //pause
	if keyboard_check_pressed(vk_numpad6) {invincible = not invincible} //invincible
	if keyboard_check_pressed(vk_numpad7) {room = R_test_collision}
	
	
	if instance_exists(player)
	{
		if invincible
		{
			global.vie = player.vie_max
			global.energie = player.energie_max
			if keyboard_check(vk_space) {
				player.speed = 15
				player.direction = point_direction(player.x, player.y, mouse_x, mouse_y)
			}
			else {player.speed = 0 player.direction = 0}
		}
	}
	
	
	if part_test {
		part_emitter_region(global.part_sys, part_emit, player.x, mouse_x, player.y, mouse_y, ps_shape_line, ps_distr_linear)
		part_emitter_burst(global.part_sys, part_emit, part_local, 5)
	}
}
