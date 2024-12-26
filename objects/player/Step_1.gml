///@description energie spe+game over
if not var_pause
{
	if energie_module_spe < energie_module_spe_max and not keyboard_check(vk_shift)
	{
		energie_module_spe += 2
		if energie_module_spe > energie_module_spe_max {energie_module_spe = energie_module_spe_max}
	}
	
	// game over
	if global.vie <= 0
	{
		var_pause = true
		visible = false
		allow_explosion = false
		instance_destroy(affichage_player)
		instance_destroy(tir_player)
		explosion(x, y, 0, 1.5)
		global.focus = 100
		instance_create_depth(x, y, 0, anim_game_over)
	}
}

