extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_high_scores_button_pressed():
		get_tree().change_scene_to_file("res://Scenes/high_scores.tscn")
