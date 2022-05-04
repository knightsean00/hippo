extends Area2D

onready var collision = get_node("CollisionShape2D")
#onready var collision = get_node("sprite")
#onready var collision = get_node("CollisionShape2D")
#onready var collision = get_node("CollisionShape2D")
#onready var collision = get_node("CollisionShape2D")

var foodSprite = load("res://Scene/FoodSprite.tscn").instance()

signal ROW_CLICKED

var foods

func init(foods):
	self.foods = []
	
	# add 4 sprites
	for i in range(foods.size()):
		var food_dict = foods[i]
		print('newsprite ', food_dict["name"])
		var newSprite = foodSprite.init(food_dict["name"], food_dict["image"], Vector2(i * 70, 0))
#		newSprite.connect("FOOD_CLICKED", self, "food_selected")
		add_child(newSprite)
		self.foods.append(newSprite)
#
func food_selected(food_name):
	print(food_name + " was clicked")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	self.foods = []
#	for i in range(self.foods.size()):
#		var food_dict = foods[i]
#		print('newsprite', food_dict["name"])
#		var sprite = foodSprite.init(food_dict["name"], food_dict["image"], Vector2(i * 70, 0))
##		self.foods.append(sprite)
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
