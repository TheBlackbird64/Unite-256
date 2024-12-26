// variables globales
global.part_sys = part_system_create()
part_system_depth(global.part_sys, -30)
global.focus = 0
global.num_sauvegarde_ouverte = 0
global.room_save = []
global.tab_id_boutons = []
global.tab_nv = [50, 60, 70, 90, 110, 130, 150, 180, 210, 240, 280, 330, 380, 450, 530, 620, 720, 840, 1000]
global.nom_armes = [mA_a1, mA_b1, mA_c1, mA_a2, mA_b2, mA_c2]//, mA_a3, mA_b3, mA_c3, mA_a4, mA_b4, mA_c4]
global.defense_ajoutee = 0
global.attaque_ajoutee = 0
global.id_armes_interdites = []
global.pos_obj_interdis = -1
global.temp_xp = -1
global.coord_p = [4415, 2250]

function setup_variable_globales()
{
	// variables à sauvegarder
	global.nom_sauvegarde = ""
	global.touche_bas = [ord("S"), "S"]
	global.touche_haut = [ord("Z"), "Z"]
	global.touche_gauche = [ord("Q"), "Q"]
	global.touche_droite = [ord("D"), "D"]
	global.vie = 100
	global.energie = 500
	global.xp = 0
	global.pieces = 0
	global.num_arme = 0
	global.num_module_spe = 0
	global.num_animations = 0
	global.niveau_termines = []
	global.objets = []
	global.items_recup = []
	global.armes_recup = []
	global.module_spe_debloques = []
}

//dessin
function draw_reset_all()
{
	draw_set_color(c_white)
	draw_set_alpha(1)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_font(-1)
}

function draw_set_all(col=-1, alpha=-1, valign=-1, halign=-1, font=-1)
{
	draw_reset_all()
	
	if col != -1 {draw_set_color(col)}
	if alpha != -1 {draw_set_alpha(alpha)}
	if valign != -1 {draw_set_valign(valign)}
	if halign != -1 {draw_set_halign(halign)}
	if font != -1 {draw_set_font(font)}
}

// fonctions de données
function liste_caracteres_non_valide(str)
{
	var liste_carac_autorises = "abcdefghijklmnopqrstuvwzyzABCDEFGHIJKLMNOPQRSTUVWZYZ1234567890_ +-=/<>"
	var verif = false
	var result = ""
	for (var i = 1; string_length(str)+1 > i; i++)
	{
		verif = false
		for (var j = 1; string_length(liste_carac_autorises) > j; j++)
		{
			if string_char_at(str, i) == string_char_at(liste_carac_autorises, j) {verif = true}
		}
		if not verif {
			result += "'" + string_char_at(str, i) + "', "
		}
	}
	if string_length(result) > 0 {result = string_copy(result, 1, string_length(result)-2)}
	return result
}

function liste_vers_tab(liste)
{
	var tab = []
	for (var i = 0; ds_list_size(liste) > i; i++)
	{
		array_push(tab, ds_list_find_value(liste, i))
	}
	return tab
}

function regrouper(tab, caractere)
{
	var a = 0
	var b = ""
	while a < array_length(tab)
	{
		b += string(tab[a]) + caractere
		a++
	}
	b = string_copy(b, 1, string_length(b)-string_length(caractere))
	
	if array_length(tab) == 0 {return caractere}
	else {return b}
}

function regrouper_2d(tab_2d, carac_1, carac_2)
{
	var temp_tab = []
	for (var i = 0; array_length(tab_2d) > i; i++)
	{
		array_push(temp_tab, regrouper(tab_2d[i], carac_2))
	}
	
	return regrouper(temp_tab, carac_1)
}

function saut_ligne_str(str, nb_carac)
{
	var num = 0
	var liste_mots = separer(str, " ")
	for (var i = 0; array_length(liste_mots) > i; i++)
	{
		if string_length(liste_mots[i]) < nb_carac
		{
			if num + string_length(liste_mots[i]) > nb_carac
			{
				liste_mots[i] = "\n" + liste_mots[i]
				num = string_length(liste_mots[i])+1
			}
			else
			{
				num += string_length(liste_mots[i])+1
			}
		}
	}
	return regrouper(liste_mots, " ")
}

function separer(str, caractere)
{
	if string_char_at(str, 1) != caractere {str = caractere + str}
	if string_char_at(str, string_length(str)) != caractere {str += caractere}
	
	var _debug_ = 0
	var tab = []
	var contenu_liste = str
	while (string_length(contenu_liste) > 2) {
		contenu_liste = string_copy(contenu_liste, string_pos(caractere, contenu_liste)+1, string_length(contenu_liste))
		array_push(tab, string_copy(contenu_liste, 1, string_pos(caractere, contenu_liste)-1))
		if (string_copy(contenu_liste, 1, string_pos(caractere, contenu_liste)-1) == "")
		{
			array_delete(tab, array_length(tab)-1, 1)
		}
		_debug_ ++
	}
	
	return tab
}

function tab_index(tab, value)
{
	var index = -1
	for (var i = 0; array_length(tab) > i; i++)
	{
		if tab[i] == value {index = i}
	}
	return index
}

// sauvegardes
function save()
{
	if instance_exists(tuto_aide) {tuto_aide.active = false}
	var tab_noms_var_save = ["nom_sauvegarde", "touche_bas", "touche_haut", "touche_gauche", "touche_droite", "vie", "energie", "xp", "pieces", "num_arme", "num_module_spe", "num_animations", "niveau_termines", "objets", "items_recup", "armes_recup", "module_spe_debloques"]
	
	var f = file_text_open_write("sauvegarde_" + string(global.num_sauvegarde_ouverte) + ".txt")
	var contenu = ""
	for (var i = 0; array_length(tab_noms_var_save) > i; i++)
	{
		contenu = variable_global_get(tab_noms_var_save[i])
		if is_array(contenu)
		{
			contenu = "#" + regrouper(variable_global_get(tab_noms_var_save[i]), ";")
		}
		file_text_write_string(f, tab_noms_var_save[i] + "=" + string(contenu))
		file_text_writeln(f)
	}
	file_text_close(f)
}

function load()
{
	var f = file_text_open_read("sauvegarde_" + string(global.num_sauvegarde_ouverte) + ".txt")
	var contenu = "a"
	var contenu2 = "a"
	while (contenu != "")
	{
		contenu = file_text_read_string(f)
		if contenu != ""
		{
			contenu = separer(contenu, "=")
			if string_char_at(contenu[1], 1) == "#"
			{
				contenu[1] = string_copy(contenu[1], 2, string_length(contenu[1]))
				contenu2 = separer(contenu[1], ";")
			}
			else
			{
				contenu2 = contenu[1]
			}
			
			try
			{
				variable_global_set(contenu[0], int64(contenu2))
			}
			catch(e)
			{
				show_debug_message(e.message)
				variable_global_set(contenu[0], contenu2)
			}
			file_text_readln(f)
		}
	}
	file_text_close(f)
}

function load_local(num_save)
{
	var f = file_text_open_read("sauvegarde_" + string(num_save) + ".txt")
	var contenu = "a"
	var contenu2 = "a"
	while (contenu != "")
	{
		contenu = file_text_read_string(f)
		if contenu != ""
		{
			contenu = separer(contenu, "=")
			if string_char_at(contenu[1], 1) == "#"
			{
				contenu[1] = string_copy(contenu[1], 2, string_length(contenu[1]))
				contenu2 = separer(contenu[1], ";")
			}
			else
			{
				contenu2 = contenu[1]
			}
			variable_instance_set(id, contenu[0], contenu2)
			file_text_readln(f)
		}
	}
	file_text_close(f)
}

// fonctions graphiques (caméras, zoom, ect..)

function set_zoom(coef)
{
	camera_set_view_size(view_camera[0], 1366*coef, 768*coef)
	camera_set_view_border(view_camera[0], 683*get_zoom(), 384*get_zoom())
}

function get_zoom()
{
	return camera_get_view_height(view_camera[0])/768
}

function cam_sync_sc(scale)
{
	return scale*get_zoom()
}

function cam_sync_x(_x)
{
	return camera_get_view_x(view_camera[0])+_x*get_zoom()
}

function cam_sync_y(_y)
{
	return camera_get_view_y(view_camera[0])+_y*get_zoom()
}

function cam_milieu_x()
{
	return camera_get_view_x(view_camera[0])+683*get_zoom()
}

function cam_milieu_y()
{
	return camera_get_view_y(view_camera[0])+384*get_zoom()
}

// xp
function get_xp(niv, ifstr, nb_xp)
{
	var tab_val = global.tab_nv
	var nv = array_length(tab_val)+1
	var reste = "niveau max."
	if not ifstr {reste = 0}
	var xp = nb_xp
	var effectue = false
	
	for (var i = 0; array_length(tab_val) > i; i++)
	{
		if not effectue{
			if xp < tab_val[i]
			{
				effectue = true
				if not ifstr {reste = xp}
				else {reste = string(xp) + "/" + string(tab_val[i])}
				nv = i+1
			}
			else
			{
				xp -= tab_val[i]
			}
		}
	}
	
	if niv {return nv}
	else {return reste}
}

function nv_xp_vie_max(xp=global.xp)
{
	var tab = [100, 120, 140, 160, 190, 220, 260, 300, 350, 410, 480, 560, 660, 770, 900, 1050, 1230, 1440, 1690, 2000]
	return tab[get_xp(true, true, xp)-1]
}

function nv_xp_energie_max(xp=global.xp)
{
	var tab = [500, 580, 680, 800, 940, 1100, 1280, 1500, 1760, 2050, 2400, 2810, 3290, 3850, 4500, 5270, 6170, 7210, 8440, 10000]
	return tab[get_xp(true, true, xp)-1]
}


// gagner du temps
function debug_ligne(reset)
{
	static ligne = 20
	if reset {ligne = 20}
	else {ligne+= 30}
	return ligne
}

function set_scale(taille)
{
	image_xscale = taille
	image_yscale = image_xscale
}

function largeur(_id=id)
{
	return _id.sprite_width/2
}

function hauteur(_id=id)
{
	return _id.sprite_height/2
}

function dernier_nv_fini()
{
	var a = 0
	for (var i = 0; array_length(global.niveau_termines) > i; i++)
	{
		if int64(global.niveau_termines[i]) > a {a = int64(global.niveau_termines[i])}
	}
	return a
}

function player_pos(_x, _y)// rooms début
{
	player_active(true)
	player.x = _x
	player.y = _y
}

function plus_grand_cote(_id=id)
{
	if _id.sprite_height > _id.sprite_width {return _id.sprite_height}
	else {return _id.sprite_width}
}

function plus_petit_cote(_id)
{
	if _id.sprite_height < sprite_width {return _id.sprite_height}
	else {return _id.sprite_width}
}

function get_player_game_over(_id)
{
	if instance_exists(player) {if _id == player.id {return not global.vie > 0}}
}
