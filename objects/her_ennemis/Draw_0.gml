event_inherited()

// vie
draw_reset_all()
draw_set_color(c_black)
var y_aj = -(sprite_height/2+20)
var x1 = 60
var y1 = 8
draw_rectangle(x-x1, y+y_aj-y1, x+x1, y+y_aj+y1, true)
draw_set_color(c_green)
if vie < vie_max/2 {draw_set_color(c_yellow)}
if vie < vie_max/4 {draw_set_color(c_red)}
if vie > 0 {draw_rectangle(x-x1+2, y+y_aj-y1+2, x-x1+2+((x1*2-4)*(vie/vie_max)), y+y_aj+y1-2, false)}

