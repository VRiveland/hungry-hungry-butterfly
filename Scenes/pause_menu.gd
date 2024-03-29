extends Control

@onready var menu_scene = preload("res://Scenes/main_menu.tscn")

signal resume_game

func _on_resume_button_pressed():
	resume_game.emit()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_menu_button_pressed():
	get_tree().change_scene_to_packed(menu_scene)
