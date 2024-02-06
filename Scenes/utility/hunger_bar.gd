extends TextureProgressBar

@onready var food = value : set = _set_food
@onready var paused = false : set = _set_paused


func _set_paused(is_paused):
	if paused:
		$HungerTimer.set_paused(false)
	else:
		$HungerTimer.set_paused(true)
	paused = is_paused

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
	$HungerTimer.wait_time = 1
	$HungerTimer.start()


func _on_hunger_timer_timeout():
	_set_food(-1)
	$HungerTimer.start()
