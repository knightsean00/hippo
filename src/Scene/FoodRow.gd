extends Area2D

onready var collision = get_node("CollisionShape2D")

var foodSprite = load("res://Scene/FoodSprite.tscn").instance()

signal ROW_CLICKED

var foods
var time = 0
var screenTime = 7
var height = OS.get_window_size()

func init(foods, startY):
	self.foods = []
	for i in range(foods.size()):
		self.foods.append(load("res://Scene/FoodSprite.tscn").instance())
	
	# add 4 sprites
	for i in range(foods.size()):
		var food_dict = foods[i]
		self.foods[i].init(food_dict["name"], food_dict["image"], Vector2(i * 40 + 60, startY))
		self.foods[i].connect("FOOD_CLICKED", self, "food_selected")
		
#func food_selected(food_name):
#	print(food_name + " was clicked")
	
func food_selected(food_name):
	print(food_name, " is selected")
	emit_signal("ROW_CLICKED", food_name)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	for foodSprite in self.foods:
		add_child(foodSprite)
		
func _process(delta):
	position += Vector2(0, height[1] * delta / screenTime)
