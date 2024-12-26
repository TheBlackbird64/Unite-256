var inst_col = collision_point(other.x, other.y, id, true, false)
show_debug_message(string(inst_col))
if inst_col
{
	with (inst_col) {set_effet(effet_chute, 1)}
}