extends Area2D

onready var collision = get_node("CollisionShape2D")

var foodSprite = load("res://Scene/FoodSprite.tscn").instance()

signal ROW_CLICKED

var foods

func init(foods):
	self.foods = []
	for i in range(foods.size()):
		self.foods.append(load("res://Scene/FoodSprite.tscn").instance())
	
	# add 4 sprites
	for i in range(foods.size()):
		var food_dict = foods[i]
		self.foods[i].init(food_dict["name"], food_dict["image"], Vector2(i * 70, 0))
		self.foods[i].connect("FOOD_CLICKED", self, "food_selected")
#
#func food_selected(food_name):
#	print(food_name + " was clicked")
func row_selected(foods):
	print('in row selected')
	
func food_selected(food_name):
	print(food_name, " is selected")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	for foodSprite in self.foods:
		add_child(foodSprite)
