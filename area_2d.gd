extends Area2D

var touching = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()
	if touching == true:
		get_node("/root/main/Player").set_gravity(980)
		
	else:
		get_node("/root/main/RigidBody2D/AnimationPlayer").play("float")
		
func _on_area_entered(area):
	touching = true
