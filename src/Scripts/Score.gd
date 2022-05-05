extends Node2D

onready var details = get_node("Details")
onready var score_node = get_node("Score")

var text = ""

var score = 5000000
var init_score = 0

func init(bar_info):
	# Expect bar_info as a list of dictionaries of form:
	# {label: "", final_val: , ideal_val: , max_val: }
#	print('bar', bar_info)
	for bar in bar_info:
		print('bar', bar)
		if bar["label"] == "calories":
			text += "Consumed " + bar["final_val"] + "calories, ideal was " + bar["ideal_val"] + '\n'
		elif bar["label"] == "mood":
			text += "Your mood was " + bar["final_val"] + " out of " + bar["max_val"] + '\n'
		else:
			text += "Consumed " + bar["final_val"] + "g of " + bar["label"] + ", ideal was " + bar["ideal_val"] + "g" + '\n'
		
		var bar_score = (abs(float(bar["final_val"]) - float(bar["ideal_val"])) / float(bar["max_val"]))
		bar_score = (1 - bar_score) * 1000000
		score += int(bar_score)
		
func _input(event):
	if event is InputEventKey && event.pressed:
		var root = get_tree().get_root()
		
		var menu = load("res://Scene/MainMenu.tscn").instance()
		
		root.remove_child(root.get_node("LoseScreen"))
		root.add_child(menu)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	score_node.text = "Score: " + str(init_score)
	details.text = self.text
	
func _process(delta):
	# Animation for score displayment
	if init_score < score:
		if init_score < score - 1000000:
			init_score += 111111
		elif init_score < score - 100000:
			init_score += 11111
		elif init_score < score - 10000:
			init_score += 1111
		elif init_score < score - 1000:
			init_score += 111
		elif init_score < score - 100:
			init_score += 11
		else:
			init_score += 1
		score_node.text = "Score: " + str(init_score)
