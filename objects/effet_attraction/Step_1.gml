if not var_pause
{
	if (not instance_exists(_parent)) or (compteur > temps) or (qte_force > lim_sup) or (qte_force < lim_inf) or get_player_game_over(_parent)
	{
		instance_destroy()
	}
	else
	{
		if _parent.id != player.id
		{
			_parent.x += lengthdir_x(qte_force, dir)
			_parent.y += lengthdir_y(qte_force, dir)
			with (_parent)
			{
				if not place_empty(x, y, her_solide)
				{
					x = xprevious
					y = yprevious
				}
			}
		}
		else
		{
			with (_parent) {deplacer_robot(x + lengthdir_x(other.qte_force, other.dir), y + lengthdir_y(other.qte_force, other.dir))}
		}
		compteur++
		qte_force += incrementation
	}
}