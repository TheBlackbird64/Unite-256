if instance_exists(_parent) {

if active
{
	var long = _parent.sprite_width
	if _parent.sprite_height > _parent.sprite_width {long = _parent.sprite_height}
	player_detecte = distance_to_object(player) < long+70 and not var_pause
}
else {player_detecte = false}

if active and player_detecte 
{
	if compteur < compteur_max {compteur ++}
}
else
{
	if compteur > 0 {compteur --}
}

souris_entree = player_detecte and collision_point(mouse_x, mouse_y, id, false, false)
set_scale(0.1*(compteur/compteur_max))


if souris_entree and mouse_check_button_pressed(mb_left)
{
	with(_parent) {event_user(3)}
}

}