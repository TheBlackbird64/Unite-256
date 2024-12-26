visible = false

portee = 0
degats = 0
stats_modules_attaque(4, "setup")
set_scale(0.7)
var liste = ds_list_create()
collision_circle_list(x, y, sprite_width/2, her_vie, true, true, liste, false)
var tab_temp = liste_vers_tab(liste)
for (var i = 0; array_length(tab_temp) > i; i++)
{
	if tab_temp[i].equipe != _parent.equipe
	{
		set_degats(tab_temp[i], degats)
	}
}
ds_list_destroy(liste)


part_elec = part_type_create()
part_type_sprite(part_elec, S_effet_elec, true, true, true)
part_type_orientation(part_elec, 0, 359, 0, 0, 0)
part_type_life(part_elec, 3, 10)
part_type_alpha2(part_elec, 1, 0.75)
part_type_size(part_elec, 0.01, 0.08, 0, 0)

part_sys = part_system_create()
part_system_depth(part_sys, depth)

part_emit = part_emitter_create(part_sys)