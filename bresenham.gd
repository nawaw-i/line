extends TileMap
onready var base = get_node("../").coordinate
onready var tile = 1
func _ready():
	var x0 = int(base[0])
	var y0 = int(base[1])
	var x1 = int(base[2])
	var y1 = int(base[3])
	draw_tile(x0, y0, x1, y1)

func draw_tile(x0, y0, x1, y1):
	var incx : int = 1
	var incy : int = 1
	var dx : int = abs(x1 - x0)
	var dy : int = abs(y1 - y0)
	if x1 < x0: incx = -incx
	if y1 < y0: incy = -incy
	var x = x0
	var y = y0
	var p
	if dx > dy:
		set_cell(x, y, tile)
		p = 2*dy-dx
		for i in dx:
			if p < 0:
				p += 2*dy
			else:
				y+=incy
				p += 2*(dy-dx)
			x+=incx
			set_cell(x, y, tile)
			print(x, " ", y)
	else:
		set_cell(x, y, tile)
		p = 2*dx-dy
		for i in dy:
			if p < 0:
				p += 2*dx
			else:
				x+=incx
				p += 2 *(dx-dy)
			y+= incy
			set_cell(x, y, tile)
			#print(x, " ", y)
