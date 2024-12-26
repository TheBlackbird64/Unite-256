///@description event ramasser

if array_length(global.objets) < 10
{
	anim_notification("objet", num_obj-1)
	
	array_push(global.objets, num_obj)
	instance_destroy(inst_aide)
	if sauvegarde_id != "-1"
	{
		array_push(global.items_recup, sauvegarde_id)
	}
	
	part_emitter_burst(part_sys, part_emit, part_obj, 50)
	instance_destroy()
}
else
{
	inst_aide.active = true
}

