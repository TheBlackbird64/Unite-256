set_scale(0.25)

if global.num_animations == 1
{
	instance_create_depth(4025, 2225, depth, pnj_chef_vaisseau_debut_jeu)
	instance_destroy()
}
if global.num_animations == 2
{
	x = 3750
	y = 660
	image_angle = 270
}