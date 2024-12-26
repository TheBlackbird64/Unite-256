create_button(bt_menu_home_quitter, cam_sync_sc(0.2), x-cam_sync_sc(130), y-cam_sync_sc(-100))
create_button(bt_menu_home_retour, cam_sync_sc(0.2), x+cam_sync_sc(130), y-cam_sync_sc(-100))
texte = "Voulez vous quitter le niveau et rejoindre le vaisseau ?"
if room == R_tutoriel
{
	texte += " (Cette action terminera le tutoriel)"
}