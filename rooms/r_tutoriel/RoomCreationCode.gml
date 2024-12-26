// R_tutoriel

if not instance_exists(player)
{
	global.coord_p[0] = 1050
	global.coord_p[1] = 6220
	player_active(true)
}
else
{
	global.temp_xp = global.xp
	global.xp = 0
	player.vie_max = nv_xp_vie_max()
	global.vie = player.vie_max
	player.energie_max = nv_xp_energie_max()
	global.energie = player.energie_max
}
instance_create_depth(0, 0, 0, tutoriel_controlleur)

global.pos_obj_interdis = array_length(global.objets)
global.id_armes_interdites = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
global.num_arme = 0


global.coord_p[0] = 4415
global.coord_p[1] = 2250