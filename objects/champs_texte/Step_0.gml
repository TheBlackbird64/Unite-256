if (not instance_exists(_parent)) and _parent != 0 {instance_destroy()}

if focus >= global.focus
{
	if collision_point(mouse_x, mouse_y, id, false, false)
	{
		image_index = 1
		if mouse_check_button_pressed(mb_left)
		{
			keyboard_string = saisie
			active = true
		}
	}
	else
	{
		image_index = 0
		if mouse_check_button_pressed(mb_left)
		{
			active = false
		}
	}
	
	if active
	{
		image_index = 1
		saisie = string_copy(keyboard_string, 1, 25)
	}
}


compteur ++
if compteur == 60 {compteur = 0}