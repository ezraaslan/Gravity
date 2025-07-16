extends RigidBody2D


func _ready():
	load_data()
	print(Global.times)

func _on_hurtbox_area_entered(area):	
	get_tree().reload_current_scene()

	
func _on_next_area_entered(area):
	Global.deaths = 0
	Global.grav = 2000
	if Global.times[Global.level - 1] == "not applicable":
		Global.times[Global.level - 1] = Global.time
	elif Global.times[Global.level - 1] > Global.time:
		Global.times[Global.level - 1] = Global.time
	Global.time = 0
	print(Global.times)
	save()
	call_deferred("_change_scene")
	Global.level+=1


func _on_animation_player_animation_finished(die):
	get_node("/root/main/Player").show()
	get_tree().paused = false
	get_tree().reload_current_scene()

func _change_scene():
	get_tree().change_scene_to_file("res://level" + str(Global.level) + ".tscn")
	

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
