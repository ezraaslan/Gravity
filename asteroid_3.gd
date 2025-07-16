extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	get_tree().paused = true
	get_node("/root/main/Player").hide()
	get_node("/root/main/RigidBody2D/AnimationPlayer").play("die")
	Global.deaths+=1
	Global.time = 0
