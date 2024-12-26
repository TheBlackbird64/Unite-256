///@description déplacement
if not var_pause
{


var diff = angle_difference(image_angle, point_direction(x, y, mouse_x, mouse_y))

if diff > 0
{
	image_angle -= vitesse_rotation
}
if diff < 0
{
	image_angle += vitesse_rotation
}
if abs(diff) <= vitesse_rotation {image_angle = point_direction(x, y, mouse_x, mouse_y)}


if (keyboard_check(global.touche_bas[0])) {
	if v_acceleration < 1 {v_acceleration += coef_acceleration}
} else {
	if v_acceleration > 0
	{
		v_acceleration -= coef_ralentissement
		if v_acceleration < 0 {v_acceleration = 0}
	}
}
if (keyboard_check(global.touche_gauche[0])) {
	if h_acceleration > -1 {h_acceleration -= coef_acceleration}
} else {
	if h_acceleration < 0
	{
		h_acceleration += coef_ralentissement
		if h_acceleration > 0 {h_acceleration = 0}
	}
}
if (keyboard_check(global.touche_haut[0])) {
	if v_acceleration > -1 {v_acceleration -=coef_acceleration}
} else {
	if v_acceleration < 0
	{
		v_acceleration += coef_ralentissement
		if v_acceleration > 0 {v_acceleration = 0}
	}
}
if (keyboard_check(global.touche_droite[0])) {
	if h_acceleration < 1 {h_acceleration += coef_acceleration}
} else {
	if h_acceleration > 0
	{
		h_acceleration -= coef_ralentissement
		if h_acceleration < 0 {h_acceleration = 0}
	}
}

if h_acceleration > 1 {h_acceleration = 1}
if v_acceleration > 1 {v_acceleration = 1}
if h_acceleration < -1 {h_acceleration = -1}
if v_acceleration < -1 {v_acceleration = -1}


deplacer_robot(x+vitesse*h_acceleration, y+vitesse*v_acceleration)

}