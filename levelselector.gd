extends CenterContainer

@onready var v_box_container = $ScrollContainer/MarginContainer/VBoxContainer
var save_path = "user://data.save"
var file = FileAccess.open(save_path, FileAccess.READ)
func _ready():
	for i in 16:
		var button = Button.new()
		load_data()
		button.text = "Level " + str(i) + " - Best Time: " + str(Global.times[i])
		v_box_container.add_child(button)

	
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
