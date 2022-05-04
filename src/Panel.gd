extends Panel


var cur_val = 1000
var max_val = 2000
var grow_rate = 0
var color

func init(init_val, max_val, grow_rate, color = Color(1, 0, 0)):
	self.cur_val = init_val
	self.max_val = max_val
	self.grow_rate = grow_rate
	self.color = color
	
	var stylebox = self.get_stylebox("panel").duplicate()
	stylebox.bg_color = self.color
	self.add_stylebox_override("panel", stylebox)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.cur_val += self.grow_rate
	var space = calc_space(self.cur_val, self.max_val)
	self.set_position(space[1])
	self.set_size(space[0])

func calc_space(cur_val, max_val):
	var max_pos = get_parent().get_position()
	var max_size = get_parent().get_size()
	
	var fill = min(max(float(cur_val), 0) / float(max_val), 1)
	var size = float(max_size.y) * fill
	
	return [Vector2(max_size.x, size), Vector2(0, max_size.y - size)]
