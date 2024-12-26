compteur ++
if compteur == compteur_max {
	compteur = -compteur_max
	part_particles_create(part_sys, x, y, part_1, 100)
}
if compteur == 0 {instance_destroy()}

y = _y + cam_sync_sc(animcurve_channel_evaluate(channel, abs(compteur/compteur_max))*150)