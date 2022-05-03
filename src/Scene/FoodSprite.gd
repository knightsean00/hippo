extends Area2D

onready var sprite = get_node("Sprite")
onready var collision = get_node("CollisionShape2D")

signal FOOD_CLICKED

var texture
var init_location
var food_name
var height

func init(food_name, image, location = Vector2(0, 0), height=64.0):
	self.food_name = food_name
	texture = image
	init_location = location
	self.height = height

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = texture
	sprite.position = init_location
	
	var scaling = self.height / sprite.texture.get_height()
	
	sprite.scale = Vector2(scaling, scaling)
	
	print(sprite.scale)
	
	collision.shape.extents = sprite.texture.get_size()
	collision.position = init_location
	
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
