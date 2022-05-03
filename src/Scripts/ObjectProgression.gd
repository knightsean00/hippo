extends Node

var rng = RandomNumberGenerator.new()
# Declare member variables here. Examples:
var categories = ["breakfast", "drink", "lunch", "snacks", "dinner", "dessert"]

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pass
#	var object_choices = choose_objects() # Replace with function body.

func choose_objects(food_types):
	rng.randomize()
	var groupings = []
	
	# make 100 groupings (can change) in order of categories variable above
	for c in range(100):
		var current_category = categories[c % 6]
		var foods = [] + food_types[current_category]
		var sample = []
		
		# append 4 randomly selected foods to sample
		for _i in range(4):
			var x = rng.randi() % foods.size()
			sample.append(foods[x]["name"])
			foods.remove(x)
		groupings.append(sample)
	
	# list of food names
	return groupings
		
		
