extends Node2D

var generator = preload("res://Scripts/ObjectProgression.gd").new()

var food_items = "res://food_items.json"

var food_types = {
	"breakfast": [],
	"lunch": [],
	"dinner": [],
	"dessert": [],
	"snacks": [],
	"drink": [],
}

var foods = {}

var testSprite = preload("res://Scene/FoodSprite.tscn").instance()
var testRow = preload("res://Scene/FoodRow.tscn").instance()

signal ROW_CLICKED

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open(food_items, file.READ)
	var text = file.get_as_text()
	var output = JSON.parse(text).result
	file.close()
	for food in output:
		var item = {
			"category": food["category"],
			"image": load("res://Food/" + food["food_name"].split(" ").join("-").replace("&", "_").to_lower() + ".png"),
			"calories": float(food["calories"]),
			"fats": float(food["fats (g)"]),
			"mood": float(food["mood (0 to 10)"]),
			"carbs": float(food["carbs (g)"]),
			"proteins": float(food["proteins (g)"]),
			"name": food["food_name"]
		}
		food_types[item["category"]].append(item)
		foods[item["name"]] = item
		
	var sequence = generator.choose_objects(food_types)
	
#	testSprite.init(sequence[0][0], \
#		foods[sequence[0][0]]["image"], \
#		Vector2(floor(get_viewport().size.x / 2), floor(get_viewport().size.y / 2)))
#	get_parent().call_deferred("add_child", testSprite)
	
#	testSprite.connect("FOOD_CLICKED", self, "food_selected")
	var height = OS.get_window_size()[1]
	
	# make groupings
	for i in range(sequence.size()):
		var group = sequence[i]
		var food_dicts = []
		for food in group:
			food_dicts.append(foods[food])
		var testRow = load("res://Scene/FoodRow.tscn").instance()
		var startY = 0 - height * i
		testRow.init(food_dicts, startY)
		get_parent().call_deferred("add_child", testRow)
		testRow.connect('ROW_CLICKED', self, "row_selected")
	
func row_selected(food_name):
	print(food_name + " was clicked")
	# TODO what to do when you press a food
	
