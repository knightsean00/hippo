extends Node2D

onready var reason = get_node("Reason")

var text = "you ate too much"

func init(text):
	self.text = text

func _ready():
	reason.text = self.text
