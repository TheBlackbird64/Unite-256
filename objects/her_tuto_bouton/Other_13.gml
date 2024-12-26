active = not active

for (var i = 0; i < instance_number(her_sys_elec_transmetteur); i++)
{
	var inst = instance_find(her_sys_elec_transmetteur, i)
	if id_transmetteur == inst.id_transmetteur {inst.sys_elec_active = not inst.sys_elec_active}
}
