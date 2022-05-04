extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var foods 

# Called when the node enters the scene tree for the first time.
func _on_RegularLevel_pressed():
	print('hi')
	var game = load("res://Scene/Level.tscn").instance()
	foods = []
	# is this right?
	game.init(foods)
	self.hide()
	get_tree().change_scene("res://Scene/Level.tscn")
	

func _on_HardLevel_pressed():
	# TODO ADD FOODS
	foods = ['Cheeseburger']
	var game = load("res://Scene/Level.tscn").instance()
	game.init(foods)
	
	self.hide()
	get_tree().change_scene("res://Scene/Level.tscn")

