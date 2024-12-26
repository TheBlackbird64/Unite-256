compteur_clic ++
_parent.texte = ""

if compteur_clic == 1
{
	_parent.texte2 = "Bienvenu! Vous êtes un robot possédant une intelligence artificielle. Votre nom de code est Unité-256."
}
if compteur_clic == 2
{
	_parent.texte2 = "Une mission a été trouvé dans la mémoire interne. Déchiffrement en cours...                                                    " + 
	"\n25%                                            \n50%                                                    " +
	"\n75%                                            \n\nDéchiffrement Terminée, vous pouvez cliquez sur suivant."
}
if compteur_clic == 3
{
	_parent.texte2 = "______________________________ Mission ______________________________ Contexte de départ: Dans cette galaxie, la plupart des systèmes existants " + 
	"sont controlés par un seul et même empire, qui s'efforce de maintenir l'ordre dans ce vaste monde. " + 
	"Vous avez été construit par celui-ci, dans une usine secrète de la capitale. Vous appartenez à une série de robots secrets, les premiers au monde dotés d'une intelligence artificielle révolutionnaire, " + 
	"ce qui vous rend supérieur à tous les autres robots."
}
if compteur_clic == 4
{
	_parent.texte2 = "Certains systèmes de la galaxie ont commencé à se révolter récemment, ce qui risque d'en entraîner d'autres. " + 
	"Vous êtes actuellement dans un vaisseau de l'empire, en direction d'une zone à tendance révolutionnaire. " + 
	"Le but de votre mission est de stopper la révolte en détruisant le robot commandant qui l'a provoqué.                               \n\n Fin de la mission."
}
if compteur_clic == 5
{
	_parent.texte2 = "Avant de finir le programme de lancement pour commencer dans le vaisseau, un tutoriel est " + 
	"disponible pour se familliariser avec le fonctionnement du jeu. (Le tutoriel est recommandé si vous n'avez jamais joué à ce jeu.)"
	with(_parent) {event_user(15)}
	instance_destroy()
}