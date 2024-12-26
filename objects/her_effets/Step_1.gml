if not var_pause
{
	if not instance_exists(_parent) or get_player_game_over(_parent) {instance_destroy()}
	else
	{
		x = _parent.x+_x
		y = _parent.y+_y
		if compteur <= 0 {instance_destroy()}
		else {compteur--}
		if variable_instance_exists(_parent, "vie") {if _parent.vie <= 0 {instance_destroy()}}
	}
}