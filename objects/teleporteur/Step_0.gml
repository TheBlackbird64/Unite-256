interagir(not var_pause)

if global.vie <= 0 {instance_destroy()}
if not var_pause
{
	if compteur > 0
	{
		compteur ++
		part_system_position(part_sys_local, player.x, player.y)
		part_particles_create(part_sys_local, 0, 0, part_local2, 8)
	}
	if compteur > 60
	{
		player.x = _x
		player.y = _y
		if _room != -1 {room = _room}
		compteur = 0
	}
}

part_particles_create(global.part_sys, x, y, part_local, 1)
part_particles_create(global.part_sys, x, y, part_local2, 6)