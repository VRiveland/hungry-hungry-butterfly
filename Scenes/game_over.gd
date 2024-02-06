extends Control

@onready var score_manager = get_tree().get_first_node_in_group("score")

var save_path = "user://highscores.json"

func _on_restart_button_pressed():
	score_manager._restart_game()
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_menu_button_pressed():
	score_manager._restart_game()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _ready():
	var new_score = round(score_manager.time_elapsed)
	if FileAccess.file_exists(save_path):
		# is there is already scores in the save file
		var file = FileAccess.open(save_path, FileAccess.READ_WRITE)
		var content := file.get_as_text()
		var data = JSON.parse_string(content)
		var scores = data.scores
		
		scores.append(new_score)
		scores.sort()
		if scores.size() > 10:
			scores.pop_front()
		var new_data := {
			"scores": scores
		}
		var json_string := JSON.stringify(data)
		file.store_string(json_string)
		file.close()
	else:
		# the first save
		var file = FileAccess.open(save_path, FileAccess.WRITE)
		var scores = [new_score]
		var data := {
			"scores": scores
		}
		var json_string := JSON.stringify(data)
		file.store_string(json_string)
		file.close()
