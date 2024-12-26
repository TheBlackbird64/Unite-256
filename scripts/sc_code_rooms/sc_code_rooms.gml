// code room cartes
function carte_creer_obj_dep()
{
	instance_create_depth(683, 384, -40, carte_dep_icon)
	instance_create_depth(0, 0, -50, bt_carte_menu_retour)
	instance_create_depth(0, 0, -50, carte_bt_zoom)
	var inst = instance_create_depth(0, 0, -50, carte_bt_zoom)
	inst.y_camera += inst.sprite_height*inst.scale
	inst.sprite_index = S_carte_bt_zoom_dezoom
	
	instance_create_depth(0, 0, -24, carte_chemin_pointilles)
}

function carte_room_1()
{
	carte_creer_obj_dep()
	//etoiles
	for (var i = 0; (room_height*room_width)/20000 > i; i++)
	{
		var inst = instance_create_depth(irandom_range(0, room_width), irandom_range(0, room_height), -10, carte_decor_etoiles)
		with (inst) {
			set_scale(random_range(0.02, 0.13))
			if irandom_range(0, 4) == 1 {col = $00FFFF}
			if irandom_range(0, 50) == 1 {col = $FF0000}
			if irandom_range(0, 20) == 1 {col = $0040FF}
		}
	}
	
	//asteroides
	for (var i = 0; 300 > i; i++)
	{
		var dir = random_range(0, 360)
		var len = random_range(1000, 1400)
		instance_create_depth(room_width/2+lengthdir_x(len, dir), room_height/2+lengthdir_y(len, dir), -20, carte_1_asteroides)
	}
	for (var i = 0; 30 > i; i++)
	{
		var dir = random_range(0, 360)
		var len = random_range(700, 1000)
		instance_create_depth(room_width/2+lengthdir_x(len, dir), room_height/2+lengthdir_y(len, dir), -20, carte_1_asteroides)
	}
	for (var i = 0; 40 > i; i++)
	{
		var dir = random_range(0, 360)
		var len = random_range(1400, 1650)
		instance_create_depth(room_width/2+lengthdir_x(len, dir), room_height/2+lengthdir_y(len, dir), -20, carte_1_asteroides)
	}
	for (var i = 0; 40 > i; i++)
	{
		var dir = random_range(180, 270)
		var len = random_range(250, 2300)
		var inst = instance_create_depth(room_width+lengthdir_x(len, dir), lengthdir_y(len, dir), -20, carte_1_asteroides, {
			vitesse : 0
		})
		with (inst) {set_scale(inst.image_xscale*1.5)}
	}
	//etoiles filantes
	instance_create_depth(0, 0, -10, carte_1_etoiles_filantes)
}

function carte_room_2()
{
	carte_creer_obj_dep()
}

function carte_room_3()
{
	carte_creer_obj_dep()
}

function carte_room_4()
{
	carte_creer_obj_dep()
}

function carte_room_5()
{
	carte_creer_obj_dep()
}