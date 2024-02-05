extends Area2D

var nectar = preload("res://Scenes/Characters and objects/nectar.tscn")
var nectar_available = false


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
	$Nectar.visible = false
	$NectarTimer.start()
