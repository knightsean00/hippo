extends Node2D

var level = preload("res://Scene/Level.tscn")
var mainMenu = preload("res://Scene/MainMenu.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().call_deferred("add_child", level)
	get_parent().call_deferred("add_child", mainMenu)
#	get_tree().change_scene("res://Scene/MainMenu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
