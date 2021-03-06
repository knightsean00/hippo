extends Area2D

onready var collision = get_node("CollisionShape2D")
onready var audio = get_node("AudioStreamPlayer")

var foodSprite = load("res://Scene/FoodSprite.tscn").instance()
var eating_sound = preload("res://Sounds/chomp.wav")

signal ROW_CLICKED
signal ROW_MISSED
signal ROW_IND

var foods
var time = 0
var screenTime = 5.0
var clicked = false
var rowInd = 0
var y = 0

func init(foods, rowInd, startY, screenTime = 5.0):
	self.screenTime = screenTime
	self.foods = []
	self.rowInd = rowInd
	self.y = startY
	for i in range(foods.size()):
		self.foods.append(load("res://Scene/FoodSprite.tscn").instance())
	
	# add 4 sprites
	for i in range(foods.size()):
		var food_dict = foods[i]
		self.foods[i].init(food_dict["name"], food_dict["image"], Vector2(i * 40 + 83, startY))
		self.foods[i].connect("FOOD_CLICKED", self, "food_selected")
		
	
func food_selected(food_name):
	if not clicked:
		audio.play()
		emit_signal("ROW_CLICKED", food_name)
		emit_signal("ROW_IND", self.rowInd)
		clicked = true
		for sprite in self.foods:
			if sprite.food_name != food_name:
				remove_child(sprite)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	for foodSprite in self.foods:
		add_child(foodSprite)
		
func _process(delta):
#	var height = get_viewport().size.y
	var height = 180
	position += Vector2(0, height * delta / self.screenTime)
	self.y += height * delta / self.screenTime
#	if self.rowInd == 23:
#		print('position', self.y)
	
#	if self.get_position().y > 180:
#		print(self.get_position())
#		print(foods)
#		print(get_parent().get_children())
#		get_parent().remove_child(self)
