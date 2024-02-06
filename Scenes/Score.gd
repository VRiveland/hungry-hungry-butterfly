extends Label

@onready var score_manager = get_tree().get_first_node_in_group("score")

func _ready():
	text = "Score: " + str(round(score_manager.time_elapsed))
