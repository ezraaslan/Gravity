extends Node2D

var touching = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if touching == true:
		get_node("/root/main/Player").set_gravity(Global.grav)
	




func _on_gravity_area_entered(area):
	touching = true


func _on_hitbox_area_entered(area):
	get_tree().paused = true
	get_node("/root/main/Player").hide()
	get_node("/root/main/RigidBody2D/AnimationPlayer").play("die")
	Global.deaths += 1
	Global.time = 0


func _on_gravity_area_exited(area):
	touching = false
