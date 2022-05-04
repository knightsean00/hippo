extends Area2D

onready var sprite = get_node("Sprite")
onready var collision = get_node("CollisionShape2D")

signal FOOD_CLICKED

var texture
var init_location
var food_name
var height
var width

func init(food_name, image, location = Vector2(0, 0), height=64.0, width=64.0):
	self.food_name = food_name
	texture = image
	init_location = location
	self.height = height
	self.width = width
	
#	var scaling = self.height / texture.get_height()
#	self.scale = Vector2(scaling, scaling)
#	self.set_scale(self.scale)
#	self.width = width

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = texture
	sprite.position = init_location
	
	var h_scale = self.height / sprite.texture.get_height()
	var w_scale = self.width / sprite.texture.get_width()
#	var scaling = sprite.texture.get_height() / self.height

	sprite.scale = Vector2(w_scale, h_scale)

	
	var a = (sprite.texture.get_size() * sprite.scale)
	print(a[0], a[1])
	collision.shape.extents = Vector2(self.height/2, self.height/2)
	collision.position = init_location
	
#func _input(event):
#	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
#		print("clicked on sprite")

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
		emit_signal("FOOD_CLICKED", food_name)

#func _unhandled_input(event):
#	print("click")
#	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
#		print("sprite has been clicked")
#		emit_signal("FOOD_CLICKED", self)
