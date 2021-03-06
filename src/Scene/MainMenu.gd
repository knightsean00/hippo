extends Control

onready var zero = get_node("Unrestricted")
onready var one = get_node("Vegetarian")
onready var two = get_node("Vegan")

var badFoods 

var cur_select = 0
var down = [16777234, 83]
var up = [16777232, 87]

var starting = false

func _ready():
	starting = false
	cur_select = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
#	var options = [zero, one, two]
#	for node in options:
#		var collide = node.get_node("CollisionShape2D")
#		print(collide)
#		collide.shape.extents = node.get_size()
#		print(node.get_position())
#		print(node.get_size())

#func _input_event(_viewport, event, _shape_idx):
#	print(_shape_idx)

func _input(event):
	if !starting && event is InputEventKey && event.pressed && (down.has(event.scancode) || up.has(event.scancode)):
		var options = [zero, one, two]
		if down.has(event.scancode):
			cur_select += 1
			if cur_select > 2:
				cur_select = 0
		elif up.has(event.scancode):
			cur_select -= 1
			if cur_select < 0:
				cur_select = 2
		for node in options:
			node.add_color_override("font_color", Color("#FFFFFF"))
		options[cur_select].add_color_override("font_color", Color("#E0A4AF"))
		
	if !starting && event is InputEventKey && event.pressed && [16777221, 16777222, 32].has(event.scancode):
		if cur_select == 0:
			starting = true
			primer("regular")
		elif cur_select == 1:
			starting = true
			primer("vegetarian")
		elif cur_select == 2:
			starting = true
			primer("vegan")

func primer(f):
	var timing = 1.0
	$Unrestricted.text = ""
	$Vegetarian.text = ""
	$Vegan.text = ""
	$Title.text = ""
	$Primer.text = "READY"
	yield(get_tree().create_timer(timing), "timeout")
	$Primer.text = "SET"
	yield(get_tree().create_timer(timing), "timeout")
	$Primer.text = "GO!"
	yield(get_tree().create_timer(timing), "timeout")
	
	call(f)

func regular():
	var forbiddenFoods = []
	var parent = get_parent()
	parent.remove_child(self)
	var game = load("res://Scene/Level.tscn").instance()
	game.init(forbiddenFoods, 4.0, 24)
	parent.add_child(game)
	
func vegetarian():
	var forbiddenFoods = ['Cheeseburger',
		 'Fried Chicken',
		 'Chicken Curry',
		 'Shawarma',
		 'Sushi Rolls',
		 'Chicken Strips',
		 'Chicken Shish Kebab',
		 'Ribeye Steak',
		 'Chili',
		 'Burrito',
		 'Pho',
		 'Gyro',
		 'Chicken Caesar Wrap',
		 'Fish Tacos',
		 'Beef Fried Rice',
		 'Beef Jerky',
		 'McMuffin',
		 'Spaghetti & Meatballs',
		 'Lasagna',
		 'Salmon',
		 'Grilled Shrimp',
		 'Chicken Noodle Soup',
		 'Meatloaf',
		 'Pad Thai',
		 'Pork Fried Rice',
		 'Turkey Sandwich',
		 'Hot Dog',
		 'Sloppy Joe Sandwich',
		 'Ham Sandwich',
		 'Poke Bowl']
	var parent = get_parent()
	parent.remove_child(self)
	var game = load("res://Scene/Level.tscn").instance()
	game.init(forbiddenFoods, 4.0, 30)
	parent.add_child(game)
	
func vegan():
	var forbiddenFoods = ['Cheeseburger',
			 'Brownie',
			 'Oatmeal Raisin Cookie',
			 'Whole Milk',
			 'Milkshake',
			 'Omelette',
			 'Pancakes',
			 'Pizza',
			 'Fried Chicken',
			 'Chicken Curry',
			 'Shawarma',
			 'Vanilla Ice Cream',
			 'Grilled Cheese Sandwich',
			 'Starbucks Mocha Frappe',
			 'Waffles',
			 'Sushi Rolls',
			 'Chocolate Cupcake',
			 'Chocolate Chip Muffin',
			 'Garlic Bread',
			 'Pink Sprinkled Donut',
			 'Chicken Strips',
			 'Chicken Shish Kebab',
			 'Coffee Latte',
			 'Cheesecake',
			 'Mac and Cheese',
			 'Ribeye Steak',
			 'French Toast',
			 'Chili',
			 'Burrito',
			 'Pho',
			 'Pecan Pie',
			 'Corn Flakes with Milk',
			 'Biscuit with Gravy',
			 'Bagel with Cream Cheese',
			 'Gyro',
			 'Chicken Caesar Wrap',
			 'Fish Tacos',
			 'Beef Fried Rice',
			 'Beef Jerky',
			 'Banana Bread',
			 'Enchiladas',
			 'Huevos Rancheros',
			 'Hot Cheetos',
			 'Apple Crisp',
			 'Tiramisu',
			 'Cinnamon roll',
			 'Scrambled Eggs',
			 'Pop Tarts',
			 'Quiche',
			 'McMuffin',
			 'Oreos',
			 'Nachos & Cheese',
			 'Spaghetti & Meatballs',
			 'Lasagna',
			 'Salmon',
			 'Grilled Shrimp',
			 'Chicken Noodle Soup',
			 'Meatloaf',
			 'Pad Thai',
			 'Pork Fried Rice',
			 'Turkey Sandwich',
			 'Hot Dog',
			 'Sloppy Joe Sandwich',
			 'Ham Sandwich',
			 'Poke Bowl',
			 'Quesadilla']
	var parent = get_parent()
	parent.remove_child(self)
	var game = load("res://Scene/Level.tscn").instance()
	game.init(forbiddenFoods, 2.5, 40)
	parent.add_child(game)
