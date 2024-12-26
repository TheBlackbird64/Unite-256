defense = 0
stats_modules_objets(id_obj, "setup")

if global.vie + vie > nv_xp_vie_max() {global.vie = nv_xp_vie_max()}
else {global.vie += vie}

if global.energie + energie > nv_xp_energie_max() {global.energie = nv_xp_energie_max()}
else {global.energie += energie}

if defense > global.defense_ajoutee {global.defense_ajoutee = defense}
global.attaque_ajoutee += degats

array_push(affichage_player.liste_id_obj, id)