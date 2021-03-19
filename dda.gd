extends TileMap
onready var base = get_node("../").coordinate
onready var step
onready var tile = 1
func _ready():
	var x0 : float = base[0]
	var y0 : float = base[1]
	var x1 : float = base[2]
	var y1 : float = base[3]
	var dx = abs(x1 - x0)
	var dy = abs(y1 - y0)
	if dy > dx:
		step = dy
	else:
		step = dx
	var x_increment : float = dx/step
	var y_increment : float = dy/step
	if x1 < x0:
		x_increment = -x_increment
	if y1 < y0:
		y_increment = -y_increment
	var x = round(x0)
	var y = round(y1)
	set_cell(x, y, tile)
	for i in step:
		x0+=x_increment
		y0+=y_increment
		x = round(x0)
		y = round(y0)
		#print(x, ", ", y)
		set_cell(x, y, tile)
	 

