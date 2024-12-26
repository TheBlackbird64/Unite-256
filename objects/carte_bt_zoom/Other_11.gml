if sprite_index == S_carte_bt_zoom_zoom
{
	set_zoom(get_zoom()*0.9)
	if get_zoom() < 0.5 {set_zoom(0.5)}
}
else
{
	set_zoom(get_zoom()*1.1)
	if get_zoom() > 3.6 {set_zoom(3.6)}
}