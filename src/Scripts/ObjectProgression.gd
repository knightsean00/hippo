extends Node


# Declare member variables here. Examples:
var categories = ["breakfast", "drink", "lunch", "snacks", "dinner", "dessert"]

# Called when the node enters the scene tree for the first time.
func _ready():
	var object_choices = choose_objects() # Replace with function body.

func choose_objects(food_types):
	
	# food types = dictionary of category -> food (food["name"])
	
	# todo check this, want children to be all the food objects
	var groupings = []
	
	# make 100 groupings (can change) in order of categories variable above
	for r in range(100):
		var current_category = food_types[100 % 6]
		var foods = [] + category_foods[current_category]
		var sample = []
		
		# add 4 randomly selected foods to sample array
		for i in range(4):
			var x = randi() % foods.size
			sample.append(foods[x])
			foods.remove(x)
		groupings.append(sample)
	
	# list of food names
	return groupings
		
		
