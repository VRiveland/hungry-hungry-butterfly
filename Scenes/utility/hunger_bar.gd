extends TextureProgressBar

@onready var game_over_scene = preload("res://Scenes/game_over.tscn")
@onready var score_manager = get_tree().get_first_node_in_group("score")

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
		score_manager._set_paused(true)
		get_tree().change_scene_to_packed(game_over_scene)
	else:
		value = food


# Called when the node enters the scene tree for the first time.
func _ready():
	$HungerTimer.wait_time = 1
	$HungerTimer.start()


func _on_hunger_timer_timeout():
	_set_food(-3)
	$HungerTimer.start()
