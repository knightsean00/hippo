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
		print('newsprite ', food_dict["name"])
		self.foods[i].init(food_dict["name"], food_dict["image"], Vector2(i * 70, 0))
#		newSprite.connect("FOOD_CLICKED", self, "food_selected")
#
func food_selected(food_name):
	print(food_name + " was clicked")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	for foodSprite in self.foods:
		add_child(foodSprite)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
