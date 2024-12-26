
inst = 0
inst2 = 0
for (var i = 0; instance_number(her_carte_planete) > i; i++)
{
	var a = instance_find(her_carte_planete, i)
	if a.num_niveau == num_nv {inst = a}
	if a.num_niveau == num_nv+1 {inst2 = a}
}

if (inst2 == 0) or dernier_nv_fini() < num_nv {instance_destroy()}
else {
	instance_create_depth(0, 0, depth, carte_chemin_pointilles, {num_nv : num_nv+1})
}

//anim
compteur = 0
compteur_max = 50

// alpha
compteur2 = 0
compteur_max2 = 150