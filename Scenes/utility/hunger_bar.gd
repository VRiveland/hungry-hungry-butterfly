extends TextureProgressBar

@onready var food = value : set = _set_food


func _set_food(food_value_change):
	var prev_food = food
	food = min(max_value, prev_food + food_value_change)
	if food <= 0:
		# TODO: end the game
		pass
	else:
		value = food


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
