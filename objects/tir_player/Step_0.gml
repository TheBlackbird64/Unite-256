if not var_pause
{
	if global.num_arme != 0
	{
		if recharge < recharge_max {recharge ++}
		if mouse_check_button(mb_left) and (recharge >= recharge_max) and (global.energie >= stats_modules_attaque(global.num_arme, "depense_energie")) and not collision_point(mouse_x, mouse_y, her_boutons, false, true) and not collision_point(mouse_x, mouse_y, interaction, false, true)
		{
			global.energie -= depense_energie
			recharge = 0
			instance_create_depth(player.x, player.y, -15, global.nom_armes[global.num_arme-1], 
			{
				_parent : player.id,
				direction : point_direction(player.x, player.y, mouse_x, mouse_y)
			})
		}
	}
}