if (not instance_exists(_parent)) and _parent != 0 {instance_destroy()}


if not effectue
{
	var a = instance_create_depth(x, y, depth-3, fen_caracteristiques_inventaire)
	a._parent = id
	a.id_module = global.objets[num_bt]
	effectue = true
}