extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var foods 

# Called when the node enters the scene tree for the first time.
func _on_RegularLevel_pressed():
	foods = []
	# is this right?
	var game = load("res://Scene/Game.tscn").instance().init(foods)
	get_tree().change_scene("res://Scene/Game.tscn")
	

func _on_HardLevel_pressed():
	# TODO ADD FOODS
	foods = ['Cheeseburger']
	var game = load("res://Scene/Game.tscn").instance().init(foods)
	get_tree().change_scene("res://Scene/Game.tscn")

