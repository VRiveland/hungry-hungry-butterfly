extends Area2D

@onready var nectars = get_tree().get_nodes_in_group("nectar")
@onready var children = get_children()
var nectar_available = false

@onready var hunger_bar = get_tree().get_first_node_in_group("hunger")
@onready var paused = false: set = _set_paused

@export var min_spawn_time = 3
@export var max_spawn_time = 15

func _set_paused(is_paused):
	if paused:
		$NectarTimer.set_paused(false)
	else:
		$NectarTimer.set_paused(true)
	paused = is_paused

# Called when the node enters the scene tree for the first time.
func _ready():
	$NectarTimer.wait_time = randf_range(min_spawn_time, max_spawn_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_nectar_timer_timeout():
	nectar_available = true
	$Nectar.visible = true
	for nectar in nectars:
		if nectar in children:
			nectar._on_nectar_generated()


func _on_nectar_nectar_eaten():
	if nectar_available:
		hunger_bar._set_food(10)
		nectar_available = false
		$Nectar.visible = false
		$NectarTimer.start()
		
