portee = 0
degats = 0
stats_modules_attaque(1, "setup")
set_scale(0.2)
vitesse = vitesse-1 + irandom_range(0, 2)
portee = portee-15 + irandom_range(0, 30)
direction = direction-30 + irandom_range(0, 60)

if num_tir > 0
{
	instance_create_depth(player.x, player.y, -15, mA_a1, 
	{
		_parent : player.id,
		num_tir : other.num_tir-1,
		direction : point_direction(player.x, player.y, mouse_x, mouse_y)
	})
}