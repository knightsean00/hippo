extends Panel

onready var inner_bar = get_node("Inner")
onready var label_node = get_node("Label")

var cur_val
var max_val
var label
var grow_rate
var color 

func init(label, init_val, max_val, grow_rate, color = Color(255, 255, 0)):
	self.label = label
	self.cur_val = init_val
	self.max_val = max_val
	self.grow_rate = grow_rate
	self.color = color
	
# Called when the node enters the scene tree for the first time.
func _ready():
	inner_bar.init(self.cur_val, self.max_val, self.grow_rate, self.color)
	label_node.text = self.label
