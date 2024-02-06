extends Control

@onready var score_manager = get_tree().get_first_node_in_group("score")

func _on_restart_button_pressed():
	score_manager._restart_game()
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_menu_button_pressed():
	score_manager._restart_game()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
