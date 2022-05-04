extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var badFoods 
var game = load("res://Scene/Level.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _on_RegularLevel_pressed():
	badFoods = []
	game.init(badFoods)
	self.hide()
	get_tree().change_scene(game)
	
func _on_VeganLevel_pressed():
	badFoods = ['Cheeseburger',
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
			 'Grits',
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
#	game.init(badFoods)
#	self.hide()
	get_tree().change_scene_to(game)
	game.init(badFoods)


func _on_VegetarianLevel_pressed():
	badFoods = ['Cheeseburger',
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
	game.init(badFoods)
#	self.hide()
	get_tree().change_scene(game)
