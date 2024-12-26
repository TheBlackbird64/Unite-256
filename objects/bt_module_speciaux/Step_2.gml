if focus >= global.focus
{
	if global.num_module_spe == module_id
	{
		image_index = 2
		var depense_energie_spe = [1, 2, 3, 4, 5, 6]
		if keyboard_check(vk_shift) and player.energie_module_spe > depense_energie_spe[module_id-1]
		{
			module_spe(module_id, 1)
			player.energie_module_spe -= depense_energie_spe[module_id-1]
		}
		else
		{
			if module_spe(module_id) {module_spe(module_id, 0)}
		}
	}
	else
	{
		if module_spe(module_id) {module_spe(module_id, 0)}
	}
}