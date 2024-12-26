active = (tab_index(global.armes_recup, string(id_module)) != -1) and (tab_index(global.id_armes_interdites, string(id_module)) == -1)
if global.num_arme == id_module
{
	image_index = 2
}

if not effectue
{
	var a = instance_create_depth(x, y, depth-1, fen_caracteristiques)
	a._parent = id
	a.id_module = id_module
	effectue = true
}