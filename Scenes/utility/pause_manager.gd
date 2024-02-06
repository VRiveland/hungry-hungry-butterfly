extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var pause_menu = get_tree().get_first_node_in_group("pause")
@onready var hunger_bar = get_tree().get_first_node_in_group("hunger")
@onready var flowers = get_tree().get_nodes_in_group("flowers")
@onready var score_manager = get_tree().get_first_node_in_group("score")

@onready var paused = false


func _input(event):
	if event.is_action_pressed("pause"):
		_handle_paused_change(!paused)

func _handle_paused_change(new_value):
	player._set_paused(new_value)
	pause_menu.visible = new_value
	hunger_bar._set_paused(new_value)
	for flower in flowers:
		flower._set_paused(new_value)
	score_manager._set_paused(new_value)
	paused = new_value


func _on_pause_menu_resume_game():
	_handle_paused_change(false)
