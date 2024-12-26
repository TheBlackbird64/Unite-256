if (num_module != global.num_arme) and (global.num_arme != 0)
{
	recharge_max = stats_modules_attaque(global.num_arme, "recharge")
	recharge = 0
	depense_energie = stats_modules_attaque(global.num_arme, "depense_energie")
	num_module = global.num_arme
}