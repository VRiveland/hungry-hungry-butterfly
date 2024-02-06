extends Control

signal resume_game


func _on_resume_button_pressed():
	resume_game.emit()


func _on_quit_button_pressed():
	get_tree().quit()
