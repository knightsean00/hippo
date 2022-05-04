extends Area2D

var foodSprite = load("res://Scene/FoodSprite.tscn").instance()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal ROW_CLICKED

var foods
#var food1
#var food2
#var food3
#var food4

func init(foods):
	for i in range(foods.size()):
		var food_dict = foods[i]
		var sprite = foodSprite.init(food_dict["name"], food_dict["image"], Vector2(i * 70, 0))
		self.foods.append(sprite)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
