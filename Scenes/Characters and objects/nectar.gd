extends Node2D

@onready var interaction_area = $InteractionArea
signal nectar_eaten

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(_on_eat)

func _on_eat():
	nectar_eaten.emit()
	
