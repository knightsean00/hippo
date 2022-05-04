extends Node2D

var level = preload("res://Scene/Level.tscn")
var mainMenu = preload("res://Scene/MainMenu.tscn").instance()
var cursor = load("res://cursor.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(cursor, 0, Vector2(16, 16))
#	get_parent().call_deferred("add_child", level)
	get_parent().call_deferred("add_child", mainMenu)
#	get_tree().change_scene("res://Scene/MainMenu.tscn")
