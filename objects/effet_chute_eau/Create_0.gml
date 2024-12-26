// pour ne pas détecter un PNJ
if not variable_instance_exists(_parent, "vitesse") {instance_destroy()}
else
{
	_parent.vitesse = 0
	compteur = 60
	//var vit = point_distance(_parent.xprevious, _parent.yprevious, _parent.x, _parent.y)
	var sc = plus_grand_cote(_parent)/2
	with (_parent) {appliquer_force(point_direction(xprevious, yprevious, x, y), sc/(other.compteur-35), 0, other.compteur-35)}
}
// particules

part_local = part_type_create() // vagues
part_type_shape(part_local, pt_shape_circle)
part_type_alpha2(part_local, 0.8, 0.3)
part_type_color_rgb(part_local, 0, 0, 100, 200, 255, 255)
part_type_size(part_local, 0.3, 1.5, 0.1, 0)//0.02, 0.1
part_type_life(part_local, 20, 30)
//part_type_direction(part_local, 0, 359, 0, 0)
//part_type_speed(part_local, 1, 2.5, 0, 0)

part_local2 = part_type_create() // eclaboussures
part_type_shape(part_local2, pt_shape_square)
part_type_alpha2(part_local2, 0.8, 0.2)
part_type_color3(part_local2, $FFFFFF, $FFFFFF, $FF6000)
part_type_size(part_local2, 0.06, 0.15, 0, 0)
part_type_life(part_local2, 40, 70)
part_type_direction(part_local2, 40, 140, 0, 0)
part_type_speed(part_local2, 4, 7, 0, 0)
part_type_gravity(part_local2, 0.1, 270)
part_type_orientation(part_local2, 0, 359, 10, 0, false)

part_sys_local = part_system_create()
part_system_depth(part_sys_local, layer_get_depth("Tiles_eau")-1)

part_emit = part_emitter_create(part_sys_local)
part_emit2 = part_emitter_create(global.part_sys)