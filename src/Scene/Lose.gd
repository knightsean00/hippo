extends Node2D

onready var reason = get_node("Reason")

var text = "you ate too much"

func init(text):
	self.text = text
	
func _input(event):
	if event is InputEventKey && event.pressed:
		var root = get_tree().get_root()
		
		var menu = load("res://Scene/MainMenu.tscn").instance()
		
		root.remove_child(root.get_node("LoseScreen"))
		root.add_child(menu)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	reason.text = self.text
