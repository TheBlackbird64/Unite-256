event_inherited()

var etoile = instance_nearest(x, y, her_carte_etoile_centrale)
var sc = sprite_get_width(sprite_index)/612
if etoile {draw_sprite_ext(S_carte_planete_anim2, 0, x, y, image_xscale*sc, image_yscale*sc, point_direction(x, y, etoile.x, etoile.y), c_white, 1)}
if image_index == 1
{
	draw_sprite_ext(S_carte_planete_anim, 0, x, y, image_xscale*sc, image_yscale*sc, (compteur_anim/compteur_anim_max)*360, c_white, 1)
}