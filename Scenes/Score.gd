extends Label

var save_path = "user://highscores.json"


func _ready():
	if FileAccess.file_exists(save_path):
		# is there is already scores in the save file
		var file = FileAccess.open(save_path, FileAccess.READ_WRITE)
		var content := file.get_as_text()
		var data = JSON.parse_string(content)
		var scores = data.scores
		print(scores)
		
		var label_text = ""
		var x = 0
		for score in scores:
			label_text = str(10-x) + ": " + str(score) + "\n" + label_text
			x +=1
		text = label_text
		

