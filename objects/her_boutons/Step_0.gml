if (not instance_exists(_parent)) and _parent != 0 {instance_destroy()}

if (focus >= global.focus) and active
{
	if touche_activation != -1
	{
		if keyboard_check_pressed(touche_activation) and (image_index != 2) {event_user(1)}
	}
	
	if collision_point(mouse_x, mouse_y, id, false, false)
	{
		image_index = 1
		if mouse_check_button(mb_left)
		{
			image_index = 2
		}
		if mouse_check_button_released(mb_left)
		{
			event_user(1)
		}
	}
	else
	{
		image_index = 0
	}
}
//else {image_index = 0} 
//Ne pas le mettre sinon bug avec les touches de raccourcis pour les menus

if not active {image_index = 3}