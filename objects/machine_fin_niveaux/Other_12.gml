if compteur == 1
{
	// animation
	show_message("Fin du niveau! La version d'essai est terminée, merci d'avoir essayé le jeu!")
}


if reponse_cinematique == "Oui" and compteur == 0
{
	compteur += 1
	cinematique(["Téléchargement...                                        \n25%" + 
	"                                        \n50%" + 
	"                                        \n75%" + 
	"                                        \n100%"
	])
	
	
}