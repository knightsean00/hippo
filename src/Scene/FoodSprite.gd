extends Area2D

onready var sprite = get_node("Sprite")
onready var collision = get_node("CollisionShape2D")

signal FOOD_CLICKED

var texture
var init_location
var food_name

func init(food_name, image, location = Vector2(0, 0)):
	self.food_name = food_name
	texture = image
	init_location = location

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = texture
	sprite.position = init_location
	collision.shape.extents = texture.get_size()
	collision.position = init_location
#	self.position = init_location
#	self.shape.extents = texture.get_size()
	print(collision.position)
	print(collision.shape.extents)
#	print(position)
#	print(self.shape)
	print("food ready")
	
#func _input(event):
#	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
#		print("clicked on sprite")


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
		emit_signal("FOOD_CLICKED", food_name)
#
#func _unhandled_input(event):
#	print("click")
#	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
#		print("sprite has been clicked")
#		emit_signal("FOOD_CLICKED", self)
