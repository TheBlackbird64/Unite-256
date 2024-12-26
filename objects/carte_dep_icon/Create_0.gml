set_zoom(1.7)

inst_aide = instance_create_depth(x, y, -40, tuto_aide)
inst_aide.texte = "Déplacez vous avec la souris pour voir la carte. Vous pouvez controler le " + 
"zoom avec la molette ou avec les boutons sur le coté. Accédez aux niveaux en cliquant sur les planètes."
inst_aide.active = false
if global.num_animations == 2 {
	inst_aide.active = true
}

x1 = 0
y1 = 0
x2 = 0
y2 = 0