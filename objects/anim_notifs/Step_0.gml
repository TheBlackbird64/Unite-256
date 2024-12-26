visible = true
set_scale(cam_sync_sc(0.75))

if not var_pause
{
	compteur++

	if compteur > compteur_max*2 {image_alpha -= 0.01}

	if image_alpha <= 0 {instance_destroy()}
}