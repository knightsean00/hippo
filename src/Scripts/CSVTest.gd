extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var path = "res://food_items.prn"

Food = preload("res://Scripts/Food.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	data = Get_data()
	for food_data in data.values():
		var newFood = Food.new(food_data)
		add_child()

func Get_data():
	#pass
	var maindata = {}
	var file = File.new()
	file.open(path, file.READ)
	while !file.eof_reached():
		var data_set = Array([file.get_csv_line()])
		maindata[maindata.size()] = data_set;
	file.close() 
	return maindata
