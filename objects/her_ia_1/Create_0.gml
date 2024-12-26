event_inherited()

reload = reload_max
detecte = false

x_origine = x
y_origine = y

dep_taille_ligne = plus_grand_cote()/2-5
grille = mp_grid_create(0, 0, round(room_width/100), round(room_height/100), 100, 100)// pas les vraies valeurs
chemin = path_add()
compteur_grille = 0
x_grille_player = 0
y_grille_player = 0
etat = -1

pos_attente = false // position attente
dep_pos_attente = 0

compteur_detection = 0
compteur_detection_max = 60


event_user(15)