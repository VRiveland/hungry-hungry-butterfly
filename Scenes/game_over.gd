extends Control

@onready var game_scene = preload("res://Scenes/game.tscn")
@onready var menu_scene = preload("res://Scenes/main_menu.tscn")

func _on_restart_button_pressed():
	get_tree().change_scene_to_packed(game_scene)


func _on_quit_button_pressed():
	get_tree().quit()


func _on_menu_button_pressed():
	get_tree().change_scene_to_packed(menu_scene)
