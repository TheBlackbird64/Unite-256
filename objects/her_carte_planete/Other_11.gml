if instance_exists(carte_affichage) {instance_destroy(carte_affichage)}

var txt = "Niveau " + string(num_niveau)
if dernier_nv_fini()+1 < num_niveau
{
	texte_description = "Erreur 404: Données manquantes"
	txt = "Objet inconnu"
}

instance_create_depth(x, y, -27, carte_affichage, {
	num_niveau : num_niveau,
	texte : txt,
	texte_description : texte_description
})