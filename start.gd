extends Control


func _on_texture_button_pressed():
	get_node("/root/Control/ColorRect/AnimationPlayer").play("leave")
	$Timer.start()
	
	
var save_path = "user://data.save"


func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Global.level)
	file.store_var(Global.times)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Global.level = file.get_var()
		Global.times = file.get_var()
	else:
		print("No data available in this file")
		Global.level = 1
		Global.times = [
			"not applicable", "not applicable", "not applicable", "not applicable",
			"not applicable", "not applicable", "not applicable", "not applicable",
			"not applicable", "not applicable", "not applicable", "not applicable",
			"not applicable", "not applicable", "not applicable", "not applicable"
		]


func _on_timer_timeout():
	load_data()
	get_tree().change_scene_to_file("res://level" + str(Global.level) + ".tscn")
