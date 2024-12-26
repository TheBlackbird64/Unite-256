// raccourcis
function Boss_tuto_canon_x()
{
	return canon.x+lengthdir_x(canon.sprite_width-canon.sprite_xoffset, canon.image_angle)
}

function Boss_tuto_canon_y()
{
	return canon.y+lengthdir_y(canon.sprite_width-canon.sprite_xoffset, canon.image_angle)
}

function Boss_tuto_p_dir()
{
	return point_direction(Boss_tuto_canon_x(), Boss_tuto_canon_y(), player.x, player.y)
}

// pattern
function Boss_tuto_declencher(num_attaque, setup)
{
	static attaque_laser_v_max = 2.5
	static attaque_laser_v = attaque_laser_v_max
	static compteur_attaque_laser = 0
	
	
	var num = num_attaque
	canon.image_angle = point_direction(x, y, player.x, player.y)
	
	// premier cycle
	if (not effectue_cycle_attaque_2)
	{
		if num > 10 {
			num = 1
			num_pattern = 1
		}
		if num == 1 {Boss_tuto_attaque_laser(setup, 360+90, 1.5, [[0, 90]])}
		if num == 2 {Boss_tuto_attaque_shoot_precis(setup, 15, 10)}
		if num == 3 {Boss_tuto_attaque_shoot_multi(setup, 60, [4, 5], 6)}
		if num == 4 {Boss_tuto_attaque_shoot_arc(setup, 5, 720, 30)}
		if num == 5 {Boss_tuto_attaque_laser(setup, 360+90, -1.5, [[0, 90]])}
		if num == 6 {Boss_tuto_attaque_shoot_multi(setup, 60, [4, 5, 7], 6)}
		if num == 7 {Boss_tuto_attaque_shoot_precis(setup, 12, 7)}
		if num == 8 {Boss_tuto_attaque_shoot_arc(setup, 5, 180, 30)}
		if num == 9 {Boss_tuto_attaque_shoot_arc(setup, 5, 180, -30)}
		if num == 10 {Boss_tuto_attaque_shoot_precis(setup, 5, 30)}
	}
	else
	{
		if num > 10 {
			num = 1
			num_pattern = 1
			attaque_laser_v = attaque_laser_v_max
			compteur_attaque_laser = 0
		}
		if num == 1 {Boss_tuto_attaque_shoot_precis(setup, 25, 10, 40)}
		if num == 2 {Boss_tuto_attaque_laser(setup, 90+90, 1.5, [[0, 90]])}
		if num == 3 {Boss_tuto_attaque_shoot_arc(setup, 3, 360*5, 40)}
		if num == 4 {Boss_tuto_attaque_laser(setup, 90+90, -1.5, [[0, 90]])}
		if num == 5 {Boss_tuto_attaque_shoot_arc(setup, 3, 370, 55, arme_boss_tuto_B)}
		if num == 6 {Boss_tuto_attaque_laser(setup, 720+90, 1.7, [[0, 90], [180, 270], [360+20, 450], [540+20, 630]])}
		if num == 7 {Boss_tuto_attaque_shoot_multi(setup, 30, [5, 7, 9, 7, 6], 10)}
		if num == 8 {Boss_tuto_attaque_shoot_precis(setup, 8, 20, 15)}
		if num == 9 {Boss_tuto_attaque_shoot_arc(setup, 15, 360*4, 100, arme_boss_tuto_B)}
		if num == 10 {
			attaque_laser_v += 0.015
			if attaque_laser_v > attaque_laser_v_max*2
			{
				attaque_laser_v = -attaque_laser_v
				compteur_attaque_laser ++
				if compteur_attaque_laser > 2 {pattern_active = false}
			}
			Boss_tuto_attaque_laser(setup, 100000, abs(attaque_laser_v)-attaque_laser_v_max , [])
		}
	}
}


function Boss_tuto_attaque_laser(setup, degres_tours, vitesse, tab_non_active=[])
{
	static angle = 0
	static part_enn1 = 0
	static part_enn2 = 0
	static part_enn3 = 0
	static part_enn4 = 0
	if setup {
		part_enn1 = part_type_create()
		part_type_shape(part_enn1, pt_shape_flare)
		part_type_alpha2(part_enn1, 1, 0.5)
		part_type_color_rgb(part_enn1, 0, 175, 0, 0, 255, 255)
		part_type_size(part_enn1, 0.3, 0.5, -0.02, 0.1)
		part_type_life(part_enn1, 2, 10)
		part_type_direction(part_enn1, 0, 359, 0, 15)
		part_type_speed(part_enn1, 0.3, 1.5, -0.01, 0)
		
		part_enn2 = part_type_create()
		part_type_shape(part_enn2, pt_shape_flare)
		part_type_alpha1(part_enn2, 1)
		part_type_size(part_enn2, 0.05, 0.2, 0, 0)
		part_type_life(part_enn2, 1, 3)
		
		part_enn3 = part_type_create()
		part_type_shape(part_enn3, pt_shape_flare)
		part_type_alpha1(part_enn3, 0.6)
		part_type_size(part_enn3, 0.3, 0.6, 0, 0)
		part_type_life(part_enn3, 1, 3)
		
		part_enn4 = part_type_create()
		part_type_shape(part_enn4, pt_shape_flare)
		part_type_alpha2(part_enn4, 1, 0.5)
		part_type_color3(part_enn4, $FFFFFF, $FF0000, $FF00C0)
		part_type_size(part_enn4, 0.3, 0.5, -0.02, 0.1)
		part_type_life(part_enn4, 10, 25)
		part_type_direction(part_enn4, 0, 359, 0, 15)
		part_type_speed(part_enn4, 3, 6, -0.01, 0)
		
		angle = 0
		return -1
	}
	
	angle += vitesse
	image_angle = angle
	if abs(angle) > abs(degres_tours)
	{
		image_angle = 0
		pattern_active = false
	}
	
	var tir = true
	for (var i = 0; array_length(tab_non_active) > i; i++)
	{
		if (tab_non_active[i][0] < abs(angle)) and (tab_non_active[i][1] > abs(angle)) {tir = false}
	}
	
	for (var i = 0; 4 > i; i++)
	{
		var long = 0
		var angle2 = 45+90*i
		var _x = x + lengthdir_x(sprite_width-110, image_angle+angle2)
		var _y = y + lengthdir_y(sprite_width-110, image_angle+angle2)
		var _x2 = _x+lengthdir_x(long, image_angle+angle2)
		var _y2 = _y+lengthdir_y(long, image_angle+angle2)
		
		while not collision_line(_x, _y, _x2, _y2, her_murs, false, true)
		{
			long += 5
			_x2 = _x+lengthdir_x(long, image_angle+angle2)
			_y2 = _y+lengthdir_y(long, image_angle+angle2)
		}
		
		if tir
		{
			if collision_line(_x, _y, _x2, _y2, player, false, true) {set_degats(player.id, 2)}
			part_emitter_region(global.part_sys, part_emit, _x, _x2, _y, _y2, ps_shape_line, ps_distr_linear)
			part_emitter_burst(global.part_sys, part_emit, part_enn1, 60)
			part_emitter_burst(global.part_sys, part_emit, part_enn3, 200)
			part_emitter_burst(global.part_sys, part_emit, part_enn2, 400)
			
			part_particles_create(global.part_sys, _x2, _y2, part_enn4, 15)
			part_particles_create(global.part_sys, _x2, _y2, part_enn2, 15)
		}
		part_particles_create(global.part_sys, _x, _y, part_enn3, 10)
	}
}

function Boss_tuto_attaque_shoot_precis(setup, tps_ecart, nb, aleatoire_degree=0)
{
	static nb_tir = 0
	static tps = 0
	static al = 0
	if setup {
		nb_tir = 0
		tps = 0
		return -1
	}
	
	canon.image_angle = (al*tps/tps_ecart)+Boss_tuto_p_dir()
	if tps == tps_ecart
	{
		tps = 0
		nb_tir ++
		
		
		anim_explosion_tir(Boss_tuto_canon_x(), Boss_tuto_canon_y())
		
		tir_ennemi(Boss_tuto_canon_x(), Boss_tuto_canon_y(), Boss_tuto_p_dir()+al, depth-3, arme_boss_tuto)
		al = irandom_range(-aleatoire_degree, aleatoire_degree)
	}
	
	tps ++
	if nb_tir > nb {pattern_active = false}
}

function Boss_tuto_attaque_shoot_multi(setup, tps_ecart, nb_proj, nb, angle=40)
{
	static nb_tir = 0
	static tps = 0
	if setup {
		nb_tir = 0
		tps = 0
		return -1
	}
	
	if tps == tps_ecart
	{
		tps = 0
		nb_tir ++
		
		anim_explosion_tir(Boss_tuto_canon_x(), Boss_tuto_canon_y())
		var temp_proj = nb_proj[nb_tir%array_length(nb_proj)]
		for (var i = 0; temp_proj > i; i++)
		{
			tir_ennemi(Boss_tuto_canon_x(), Boss_tuto_canon_y(), Boss_tuto_p_dir()-(temp_proj-1)*angle/2+angle*i, depth-3, arme_boss_tuto, 0.15)
		}
	}
	
	tps ++
	if nb_tir > nb {pattern_active = false}
}

function Boss_tuto_attaque_shoot_arc(setup, tps_ecart, degres_tours, angle=40, arme=arme_boss_tuto)
{
	static temp_angle = 0
	static tps = 0
	if setup {
		temp_angle = 0
		tps = 0
		return -1
	}
	
	canon.image_angle = Boss_tuto_p_dir()+temp_angle+(tps/tps_ecart)*angle
	if tps == tps_ecart
	{
		temp_angle += angle
		tps = 0
		
		anim_explosion_tir(Boss_tuto_canon_x(), Boss_tuto_canon_y())
		tir_ennemi(Boss_tuto_canon_x(), Boss_tuto_canon_y(), Boss_tuto_p_dir()+temp_angle, depth-3, arme)
	}
	
	tps ++
	if abs(temp_angle) >= degres_tours {pattern_active = false}
}
