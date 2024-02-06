extends Node2D

@onready var time_elapsed
@onready var paused = true : set = _set_paused


func _set_paused(is_paused):
	paused = is_paused

# Called when the node enters the scene tree for the first time.
func _ready():
	time_elapsed = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !paused:
		time_elapsed += delta


func _restart_game():
	time_elapsed = 0.0
	paused = true
