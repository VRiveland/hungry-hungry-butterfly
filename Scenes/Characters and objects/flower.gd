extends Area2D

var nectar = preload("res://Scenes/Characters and objects/nectar.tscn")
var nectar_available = false

signal can_eat_nectar;

# Called when the node enters the scene tree for the first time.
func _ready():
	$NectarTimer.wait_time = randf_range(1, 5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_nectar_timer_timeout():
	nectar_available = true
	$Nectar.visible = true


func _on_player_ate_nectar_2():
	# TODO: remove nectar instance
	# TODO: start nectar timer
	pass # Replace with function body.



func _on_nectar_area_entered(area):
	if nectar_available:
		can_eat_nectar.emit()
