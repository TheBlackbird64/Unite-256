
// event jeu
function player_active(active = not instance_exists(player))
{
	if active
	{
		if not instance_exists(player)
		{
			creer_bouton_jeu()
			instance_create_depth(global.coord_p[0], global.coord_p[1], 0, player)
		}
	}
	else
	{
		for (var i = 0; array_length(global.tab_id_boutons) > i; i++)
		{
			instance_destroy(global.tab_id_boutons[i])
		}
		if instance_exists(player) {instance_destroy(player)}
	}
}

function transition(_room=-1)
{
	instance_create_depth(0, 0, -10000, obj_transition,
	{
		_room_ : _room
	})
}

function pause(val, pause_elec=true)
{
	with (her_pause)
	{
		var_pause = not val
		event_user(0)
	}
	if not pause_elec
	{
		with (her_sys_elec_generateur)
		{
			var_pause = true
			event_user(0)
		}
		with (her_sys_elec_transmetteur)
		{
			var_pause = true
			event_user(0)
		}
		with (her_porte_elec)
		{
			var_pause = true
			event_user(0)
		}
	}
}

function cinematique(tab_txt, tab_choix=[])
{
	if (not is_array(tab_txt)) or (not is_array(tab_choix)) {show_error("l'argument n'est pas un tableau", true)}
	var _id = id
	var temp_tab = []
	array_copy(temp_tab, 0, tab_txt, 0, array_length(tab_txt))
	instance_create_depth(cam_milieu_x(), cam_sync_y(630), -48, obj_cinematique, {
		tab_txt : temp_tab,
		tab_choix : tab_choix,
		_parent : _id
	})
}

function interagir(active)
{
	if variable_instance_exists(id, "id_inter")
	{
		id_inter.active = active
	}
	else
	{
		id_inter = instance_create_depth(x, y, -41, interaction, {
			_parent : other.id,
			active : active
		})
	}
}

function module_spe(num_module=-1, etat=-1)
{
	static tab_etats = [0, 0, 0, 0, 0, 0]
	static inst = instance_create_depth(0, 0, depth, anim_module_spe)
	if num_module == -1 {return tab_index(tab_etats, 1) != -1}
	if etat != -1
	{
		tab_etats[num_module-1] = etat
		inst.module_id = num_module
		inst.active = etat != 0
	}
	return tab_etats[num_module-1] == 1
}

function module_interact(num_module)
{
	if num_module == 1
	{
		if module_spe(num_module) {visible = true}
		else {visible = false}
	}

	if num_module == 2
	{
		if module_spe(num_module)
		{
			visible = true
			_depth = depth
			depth = -41
		}
		else
		{
			if not variable_instance_exists(id, "_depth") {_depth = depth}
			depth = _depth
			visible = false
		}
	}
}

function utiliser_objet(num_obj)
{
	// 7 objets vie, 7 defense, 7 energie, 7attaque = 28
	// le reste au choix
	var liste = []
	for (var i = 0; 28+1 > i; i++) {array_push(liste, "")}
	//array_push(liste, nom_objet1)
	//array_push(liste, nom_objet2)
	//...
	if not (liste[num_obj] == "") {
		instance_create_depth(x, y, -10, liste[num_obj], {
			id_obj : num_obj
		})
	}
	instance_create_depth(x, y, -10, her_effet_objet, {
		id_obj : num_obj
	})
}


// ennemis interactions
function loot(_x, _y, pieces, xp)
{
	var inst = instance_create_depth(_x, _y, -20, loots)
	inst.nb_pieces = pieces
	inst.nb_xp = xp
	
	var change_nv = get_xp(true, false, global.xp)
	global.xp += xp
	global.pieces += pieces
	if change_nv != get_xp(true, false, global.xp)
	{
		anim_lvl_xp_suivant()
	}
}

function set_effet(effet, nv_effet)
{
	
	var verif = true
	var nv_effet2 = nv_effet-1
	if instance_number(effet) > 0
	{
		for (var i = 0; instance_number(effet) > i; i++)
		{
			var inst_temp = instance_find(effet, i)
			if inst_temp._parent == id
			{
				if inst_temp.nv_effet <= nv_effet2
				{
					inst_temp.nv_effet = nv_effet2
					with (inst_temp) {event_user(15)}
				}
				verif = false
				return inst_temp
			}
		}
	}
	if verif
	{
		var a = instance_create_depth(x, y, depth-10, effet, 
		{
			_parent : id,
			nv_effet : nv_effet2
		})
		return a
	}
}

function set_degats(cible, nb_degats, hitflash_time=20)
{
	if cible == player.id
	{
		nb_degats = round(nb_degats*(1-global.defense_ajoutee/100))
		if global.vie - nb_degats < 0 {global.vie = 0}
		else {global.vie -= nb_degats}
		
		if (room == R_tutoriel) and global.vie == 0 {global.vie = 1}
		if debug.invincible {global.vie = player.vie_max} //debug
		with (cible) {hitflash($0000FF, hitflash_time, cible)}
	}
	else
	{
		if variable_instance_exists(cible, "vie") // important car pnj sont des her_vie mais pas de vie
		{
			nb_degats = round(nb_degats*(1-global.attaque_ajoutee/100))
			if cible.vie - nb_degats < 0 {cible.vie = 0}
			else {cible.vie -= nb_degats}
			
			with (cible) {hitflash($0000FF, hitflash_time, cible)}
			if variable_instance_exists(cible, "tab_id_parties_robots") {for (var i = 0; array_length(cible.tab_id_parties_robots) > i; i++) {hitflash($0000FF, hitflash_time, cible.tab_id_parties_robots[i])}}
		}
	}
}

function explosion(_x, _y, degats=0, taille=1)
{
	static part_fumee = part_type_create() {
	part_type_shape(part_fumee, pt_shape_explosion)
	part_type_color2(part_fumee, $777777, $333333)
	part_type_alpha2(part_fumee, 1, 0.25)
	part_type_direction(part_fumee, 0, 359, 0, 0)
	part_type_gravity(part_fumee, 0.005, 90)
	part_type_speed(part_fumee, 0.2, 0.8, 0, 0)
	part_type_life(part_fumee, 70, 120)
	part_type_size(part_fumee, 0.2, 0.8, 0, 0)
	}

	static part_explosion = part_type_create() {
	part_type_shape(part_explosion, pt_shape_flare)
	part_type_color3(part_explosion, $FFFFFF, $42F5FF, $0000A3)
	part_type_direction(part_explosion, 0, 359, 0, 0)
	part_type_speed(part_explosion, 1, 2, -0.03, 0)
	part_type_life(part_explosion, 55, 80)
	part_type_alpha2(part_explosion, 1, 0.75)
	part_type_size(part_explosion, 0.2, 0.4, 0, 0)
	}

	static part_explosion2 = part_type_create() {
	part_type_shape(part_explosion2, pt_shape_flare)
	part_type_color2(part_explosion2, $42F5FF, $0000A3)
	part_type_direction(part_explosion2, 0, 359, 0, 0)
	part_type_speed(part_explosion2, 1, 2, -0.03, 0)
	part_type_life(part_explosion2, 30, 50)
	part_type_alpha2(part_explosion2, 1, 0.75)
	part_type_size(part_explosion2, 0.2, 0.4, 0, 0)
	}

	static part_explosion3 = part_type_create() {
	part_type_shape(part_explosion3, pt_shape_flare)
	part_type_color2(part_explosion3, $0053FF, $000070)
	part_type_direction(part_explosion3, 0, 359, 0, 0)
	part_type_speed(part_explosion3, 1, 2, -0.03, 0)
	part_type_life(part_explosion3, 20, 30)
	part_type_alpha2(part_explosion3, 1, 0.75)
	part_type_size(part_explosion3, 0.2, 0.4, 0, 0)
	part_type_step(part_explosion3, -400, part_fumee)
	}
	
	static part_emit = part_emitter_create(global.part_sys)
	static part_emit2 = part_emitter_create(global.part_sys)
	static part_emit3 = part_emitter_create(global.part_sys)

	part_emitter_region(global.part_sys, part_emit3, _x+50*taille, _x-50*taille, _y+50*taille, _y-50*taille, ps_shape_ellipse, ps_distr_invgaussian)
	part_emitter_region(global.part_sys, part_emit2, _x+40*taille, _x-40*taille, _y+40*taille, _y-40*taille, ps_shape_ellipse, ps_distr_invgaussian)
	part_emitter_region(global.part_sys, part_emit, _x+20*taille, _x-20*taille, _y+20*taille, _y-20*taille, ps_shape_ellipse, ps_distr_gaussian)
	
	part_emitter_burst(global.part_sys, part_emit3, part_fumee, 100*taille)
	repeat(300*taille) {
		part_emitter_burst(global.part_sys, part_emit, part_explosion, 1)
		part_emitter_burst(global.part_sys, part_emit2, part_explosion2, 1)
		part_emitter_burst(global.part_sys, part_emit3, part_explosion3, 1)
	}
	
	var liste = ds_list_create()
	collision_circle_list(_x, _y, 50*taille, her_vie, false, true, liste, false)
	var temp_tab = liste_vers_tab(liste)
	for (var i = 0; array_length(temp_tab) > i; i++)
	{
		var inst = temp_tab[i]
		
		var dist_bord = (50*taille)-point_distance(_x, _y, inst.x, inst.y)
		if inst.allow_explosion {with (inst) {appliquer_force(point_direction(_x, _y, inst.x, inst.y), dist_bord/7, -dist_bord/200, 20)}}
		set_degats(inst, degats)
	}
	
	ds_list_destroy(liste)
}

function appliquer_force(dir, qte_force, incrementation, temps, lim_sup=500, lim_inf=0)
{
	var _id = id
	instance_create_depth(x, y, depth, effet_attraction, {
		_parent : _id,
		dir : dir,
		qte_force : qte_force,
		incrementation : incrementation,
		temps : temps,
		lim_sup : lim_sup,
		lim_inf : lim_inf
	})
}


// function ennemis
function detect_anim(tps)
{
	instance_create_depth(x, y-sprite_height/2+20, depth-1, anim_detect_ennemis, {
		compteur_max : tps
	})
}

function tir_ennemi(_x, _y, dir, _depth, arme_id, taille=-1)
{
	var _id = id
	var inst = instance_create_depth(_x, _y, _depth, arme_id, 
	{
		_parent : _id,
		direction : dir
	})
	if taille != -1 {with (inst) {set_scale(taille)}}
}

// animations
function anim_explosion_tir(_x, _y)
{
	static part_armeA = part_type_create()
	part_type_shape(part_armeA, pt_shape_flare)
	part_type_alpha2(part_armeA, 1, 0.5)
	part_type_color_rgb(part_armeA, 255, 255, 0, 130, 0, 0)
	part_type_size(part_armeA, 0.3, 0.5, -0.02, 0)
	part_type_life(part_armeA, 10, 30)
	part_type_direction(part_armeA, 0, 359, 0, 0)
	part_type_speed(part_armeA, 1, 3, -0.02, 0)

	static part_armeB = part_type_create()
	part_type_shape(part_armeB, pt_shape_explosion)
	part_type_alpha2(part_armeB, 0.8, 0.5)
	part_type_color2(part_armeB, $333333, $CCCCCC)
	part_type_size(part_armeB, 0.4, 0.7, -0.02, 0)
	part_type_life(part_armeB, 20, 50)
	part_type_direction(part_armeB, 0, 359, 0, 0)
	part_type_speed(part_armeB, 0.5, 4, -0.02, 0)
	
	part_particles_create(global.part_sys, _x, _y, part_armeB, 70)
	part_particles_create(global.part_sys, _x, _y, part_armeA, 20)
}

function anim_lvl_xp_suivant()
{
	instance_create_depth(cam_sync_x(683), cam_sync_y(0), -50, anim_lvl_xp)
}

function anim_notification(type_obj, num)
{
	instance_create_depth(x, y, -40, anim_notifs, {
		type_obj : type_obj,
		num : num
	})
}

function generer_eclair(col=$FFFFFF, _x=x, _y=y, _depth=depth, compteur_max=15)
{
	var a = instance_create_depth(_x, _y, _depth, eclair)
	a.couleur = col
	a.compteur_max = compteur_max
	a.compteur = compteur_max
}

function hitflash(col, temps, parent)
{
	var ok = true
	if variable_instance_exists(parent, "allow_hitflash") {ok = parent.allow_hitflash}
	if ok
	{
		instance_create_depth(x, y, depth-1, effet_hitflash, 
		{
			_parent: parent,
			compteur_max : temps,
			couleur : col
		})
	}
}
