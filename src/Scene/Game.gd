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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
