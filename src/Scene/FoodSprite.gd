extends Area2D

onready var sprite = get_node("Sprite")
onready var collision = get_node("CollisionShape2D")


var food_items = "res://food_items.json"

var food_types = {
	"breakfast": [],
	"lunch": [],
	"dinner": [],
	"dessert": [],
	"snacks": [],
	"drinks": [],
}
	
var images = []
var rng = RandomNumberGenerator.new()

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
			"file_name": food["food_name"].split(" ").join("-").replace("&", "_").to_lower() + ".png",
			"calories": float(food["calories"]),
			"fats": float(food["fats (g)"]),
			"mood": float(food["mood (0 to 10)"]),
			"carbs": float(food["carbs (g)"]),
			"proteins": float(food["proteins (g)"]),
			"name": food["food_name"]
		}
		var fileCheck = File.new()
		if !fileCheck.file_exists("res://Food/" + item["file_name"]):
			print(item["name"])
			print("res://Food/" + item["file_name"])
	
	
#	var dir = Directory.new()
#	if dir.open("res://Food/") == OK:
#		dir.list_dir_begin()
#		var file_name = dir.get_next()
#		while file_name != "":
#			if file_name.ends_with(".png"):
#				images.append(load("res://Food/" + file_name))
#			file_name = dir.get_next()
#	var img = images[rng.randi_range(0, images.size() - 1)]
#	sprite.set_texture(img)
#	collision.shape.extents = img.get_size()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _input_event(_viewport, event, _shape_idx):
#	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
#		var img = images[rng.randi_range(0, images.size() - 1)]
#		sprite.set_texture(img)
#		collision.shape.extents = img.get_size()
