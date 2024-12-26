// R_vaisseau

if not instance_exists(player)
{
	player_active(true)
}
else
{
	if global.temp_xp != -1 {
		global.xp = global.temp_xp
		global.temp_xp = -1
	}
	player.vie_max = nv_xp_vie_max()
	global.vie = player.vie_max
	player.energie_max = nv_xp_energie_max()
	global.energie = player.energie_max
	player.x = 4415
	player.y = 2250
}
global.room_save = []
global.id_armes_interdites = []
global.pos_obj_interdis = -1
