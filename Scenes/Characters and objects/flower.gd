extends Area2D

var nectar = preload("res://Scenes/Characters and objects/nectar.tscn")
var nectar_available = false
@onready var hunger_bar = get_tree().get_first_node_in_group("hunger")

@onready var paused = false: set = _set_paused


func _set_paused(is_paused):
	if paused:
		$NectarTimer.set_paused(false)
	else:
		$NectarTimer.set_paused(true)
	paused = is_paused

# Called when the node enters the scene tree for the first time.
func _ready():
	$NectarTimer.wait_time = randf_range(1, 5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_nectar_timer_timeout():
	nectar_available = true
	$Nectar.visible = true


func _on_nectar_nectar_eaten():
	if nectar_available:
		hunger_bar._set_food(10)
		nectar_available = false
		$Nectar.visible = false
		$NectarTimer.start()
