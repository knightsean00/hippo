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

	var food_dicts = []
	for food in sequence[0]:
		food_dicts.append(foods[food])
	testRow.init(food_dicts)
	get_parent().call_deferred("add_child", testRow)
#	get_parent().call_deferred("add_child", testRow)
#	for food in testRow.foods:
#		get_parent().call_deferred("add_child", food)
#	testRow.connect("ROW CLICKED", self, "row_selected")
	
	# connect food row here?
	
func row_selected(foods):
	pass
	
func food_selected(food_name):
	print(food_name + " was clicked")
