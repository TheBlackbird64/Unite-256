detect = (point_distance(x, y, player.x, player.y) < portee_detection) or detect
if not detect {vie = vie_max}
//variables bcp utilisés
canon = tab_id_parties_robots[1]

if (vie < vie_max/2) and not effectue_cycle_attaque_2 {
	effectue_cycle_attaque_2 = true
	num_pattern = 0
	tps_attente_max = 50
	pattern_active = false
}

if (not var_pause) and active
{
	if (not pattern_active) and detect
	{
		tps_attente = 0
		num_pattern ++
		pattern_active = true
		Boss_tuto_declencher(num_pattern, true)
	}

	if tps_attente < tps_attente_max {
		tps_attente ++
		canon.image_angle = point_direction(x, y, player.x, player.y)
	}
	if pattern_active and (tps_attente_max <= tps_attente) {Boss_tuto_declencher(num_pattern, false)}
}

// anim
if effectue_cycle_attaque_2
{
	var al = 25
	part_particles_create(global.part_sys, x+irandom_range(-al, al)-70, y+irandom_range(-al, al)-30, part_arme_boss, 2)
	part_particles_create(global.part_sys, x+irandom_range(-al, al)+40, y+irandom_range(-al, al)+100, part_arme_boss, 1)
}

if vie == 0 {
	if active {explosion(x+irandom_range(-60, 60), y+irandom_range(-60, 60), 0, 2.5)}
	active = false
	part_particles_create(global.part_sys, x+irandom_range(-al, al)-120, y+irandom_range(-al, al)+60, part_arme_boss, 2)
	part_particles_create(global.part_sys, x+irandom_range(-al, al)+30, y+irandom_range(-al, al)-20, part_arme_boss, 1)
	with (canon)
	{
		var a = set_effet(effet_feu, 1)
		a.qte = 1
	}
}
if not active {
	vie = vie2
	allow_hitflash = false
	tab_id_parties_robots[0].allow_hitflash = false
	tab_id_parties_robots[1].allow_hitflash = false
}