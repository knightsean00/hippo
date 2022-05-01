extends Node

class_name Food

var filepath: String
var category: String
var calories: int
var fats: float
var carbs: float
var proteins: float
var mood: int

func _init(info):
	filepath = info[0]
	category = info[1]
	calories = info[2]
	fats = info[3]
	carbs = info[4]
	proteins = info[5]
	mood = info[6]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
