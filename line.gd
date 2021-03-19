extends Node2D
onready var coordinate
onready var dda = preload("res://dda.tscn")
onready var bresenham = preload("res://bresenham.tscn")
func _ready():
	$clear.set_disabled(true)


func _on_draw_button_up():
	coordinate = [str2var($x0.get_text()), str2var($y0.get_text()),str2var($x1.get_text()), str2var($y1.get_text())]
	$draw.set_disabled(true)
	var binst = bresenham.instance()
	binst.position = Vector2(200, 200)
	self.add_child(binst)
	var dinst = dda.instance()
	dinst.position = Vector2(600, 200)
	self.add_child(dinst)
	$clear.set_disabled(false)


func _on_clear_button_up():
	get_node("bresenham").queue_free()
	get_node("dda").queue_free()
	$clear.set_disabled(true)
	$draw.set_disabled(false)
