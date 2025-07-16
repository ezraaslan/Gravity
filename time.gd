extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.time+=delta
	get_node("/root/main/RigidBody2D/Node2D/time").text = str(snapped(Global.time, 0.1))
