extends Control

onready var zero = get_node("Unrestricted")
onready var one = get_node("Vegetarian")
onready var two = get_node("Vegan")

var foods 

var cur_select = 0
var down = [16777234, 83]
var up = [16777232, 87]

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
#	var options = [zero, one, two]
#	for node in options:
#		var collide = node.get_node("CollisionShape2D")
#		print(collide)
#		collide.shape.extents = node.get_size()
#		print(node.get_position())
#		print(node.get_size())

#func _input_event(_viewport, event, _shape_idx):
#	print(_shape_idx)

func _input(event):
	if event is InputEventKey && event.pressed && (down.has(event.scancode) || up.has(event.scancode)):
		var options = [zero, one, two]
		if down.has(event.scancode):
			cur_select += 1
			if cur_select > 2:
				cur_select = 0
		elif up.has(event.scancode):
			cur_select -= 1
			if cur_select < 0:
				cur_select = 2
		for node in options:
			node.add_color_override("font_color", Color("#FFFFFF"))
		options[cur_select].add_color_override("font_color", Color("#E0A4AF"))
		
	if event is InputEventKey && event.pressed && (event.scancode == 16777221 || event.scancode == 16777222):
		if cur_select == 0:
			regular()
		elif cur_select == 1:
			vegetarian()
		elif cur_select == 2:
#			vegan()
			pass
		

# Called when the node enters the scene tree for the first time.
func regular():
	print('hi')
	var game = load("res://Scene/Level.tscn").instance()
	foods = []
	# is this right?
	game.init(foods)
	self.hide()
	get_tree().change_scene("res://Scene/Level.tscn")


func vegetarian():
	# TODO ADD FOODS
	foods = ['Cheeseburger']
	var game = load("res://Scene/Level.tscn").instance()
	game.init(foods)

	self.hide()
	get_tree().change_scene("res://Scene/Level.tscn")

