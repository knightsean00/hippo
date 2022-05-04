extends Node2D

var level = preload("res://Scene/Level.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().call_deferred("add_child", level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
