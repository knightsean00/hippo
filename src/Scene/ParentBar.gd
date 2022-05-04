extends Panel

onready var inner_bar = get_node("Inner")
onready var label_node = get_node("Label")
onready var ideal = get_node("Ideal")

var init_val
var max_val
var label
var grow_rate
var color 
var ideal_val


func init(label, init_val, ideal_val, max_val, grow_rate, color = Color(255, 255, 0)):
	self.label = label
	self.init_val = init_val
	self.ideal_val = ideal_val
	self.max_val = max_val
	self.grow_rate = grow_rate
	self.color = color
	
func change_val(delta):
	inner_bar.cur_val += delta
	
# Called when the node enters the scene tree for the first time.
func _ready():
	inner_bar.init(self.init_val, self.max_val, self.grow_rate, self.color)
	label_node.text = self.label
	
	var ideal_pos = (1 - (float(self.ideal_val) / float(self.max_val))) * self.get_size().y
	ideal.set_position(Vector2(0, ideal_pos))
	
	inner_bar.connect("LOSE", self, "handle_loss")
		
func handle_loss(too_high):
	if too_high && self.label == "mood":
		return
		
	var level = get_tree().get_root().get_node("Level")
	get_tree().get_root().remove_child(level)
	
	var lose_screen = load("res://Scene/Lose.tscn").instance()
	if too_high && self.label != "mood":
		lose_screen.init("Your consumption of " + self.label.to_upper() + " was too high...")
	elif !too_high && self.label != "mood":
		lose_screen.init("Your consumption of " + self.label.to_upper() + " was too low...")
	elif !too_high && self.label == "mood":
		lose_screen.init("Your " + self.label.to_upper() + " was too low...")
	get_tree().get_root().add_child(lose_screen)
