global.num_sauvegarde_ouverte = _parent.num_sauvegarde
load()

if global.num_animations > 0
{
	transition(R_vaisseau)
}
else
{
	transition(R_introduction)
}