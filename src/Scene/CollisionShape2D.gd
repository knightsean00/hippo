extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input_event(_viewport, event, _shape_idx):
	print("click")
	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
		print("sprite has been clicked")
		emit_signal("FOOD_CLICKED", self)
