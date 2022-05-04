extends Node2D

var generator = preload("res://Scripts/ObjectProgression.gd").new()

var food_items = "res://food_items.json"

var bar_info = [
	{
		"label": "carbs",
		"init_val": 130,
		"max_val": 500,
		"ideal_val": 325,
		"rate": -7.5,
		"color": Color("#E0A4AF"),
		"position": Vector2(5, 16)
	},
	{
		"label": "proteins",
		"init_val": 25,
		"max_val": 160,
		"ideal_val": 60,
		"rate": -1.8,
		"color": Color("#FED148"),
		"position": Vector2(35, 16)
	},
	{
		"label": "fats",
		"init_val": 35,
		"max_val": 150,
		"ideal_val": 75,
		"rate": -1.875,
		"color": Color("#85A5EA"),
		"position": Vector2(65, 16)
	},
	{
		"label": "calories",
		"init_val": 1000,
		"max_val": 4000,
		"ideal_val": 2000,
		"rate": -60,
		"color": Color("#99C1B9"),
		"position": Vector2(270, 16)
	},
	{
		"label": "mood",
		"init_val": 10,
		"max_val": 20,
		"ideal_val": 19,
		"rate": -.75,
		"color": Color("#A192C8"),
		"position": Vector2(300, 16)
	},
]

var bars = {}

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
var forbiddenFoods = []
var n = 100
var screenTime = 5.0

signal ROW_CLICKED

func init(forbidden, screenTime=5.0, n=100):
	self.forbiddenFoods = forbidden
	self.n = n
	self.screenTime = screenTime
	
# Called when the node enters the scene tree for the first time.
func _ready():
#	print('bad', global.forbiddenFoods)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$ColorRect.set_size(OS.get_window_size())
	
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
	
	for bar in bar_info:
		bars[bar["label"]] = load("res://Scene/Bar.tscn").instance()
	for bar in bar_info:
		bars[bar["label"]].init(bar["label"], bar["init_val"], bar["ideal_val"], bar["max_val"], bar["rate"], bar["color"])
		bars[bar["label"]].set_position(bar["position"])
		self.call_deferred("add_child", bars[bar["label"]])
		
	
	var sequence = generator.choose_objects(food_types, self.n)
	
	# make groupings
#	var height = get_viewport().size.y
	var height = 180
	for i in range(sequence.size()):
		var group = sequence[i]
		var food_dicts = []
		for food in group:
			food_dicts.append(foods[food])
		var testRow = load("res://Scene/FoodRow.tscn").instance()
		var startY = 0 - height * i
		testRow.init(food_dicts, startY, self.screenTime)
		self.call_deferred("add_child", testRow)
		testRow.connect('ROW_CLICKED', self, "row_selected")
		
#	var group = sequence[-1]
#	var food_dicts = []
#	for food in group:
#		food_dicts.append(foods[food])
#	var testRow = load("res://Scene/FoodRow.tscn").instance()
#	var startY = 0 - height * (sequence.size() - 1)
#	testRow.init(food_dicts, startY, self.screenTime)
#	self.call_deferred("add_child", testRow)
#	testRow.connect('ROW_CLICKED', self, "last_selected")
#	testRow.connect("ROW_MISSED", self, "last_selected")

func last_selected(food_name = null):
	if food_name != null:
		row_selected(food_name)
		print("actually selected")
	print("clean up here")

func row_selected(food_name):
#	print(food_name)
#	print(global.forbiddenFoods.has(food_name))
	var food_info = foods[food_name]
	if self.forbiddenFoods.has(food_name):
		var lose_screen = load("res://Scene/Lose.tscn").instance()
		var root = get_tree().get_root()
		root.remove_child(root.get_node("Level"))
		lose_screen.init(food_name + " cannot be consumed!")
		root.add_child(lose_screen)
		
	for label in bars:
		var bar = bars[label]
		var delta = food_info[label]
		bar.change_val(delta)
