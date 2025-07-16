extends CharacterBody2D

@export var speed = randf_range(750, 1500)
var player_pos
var target_pos
@onready var player = get_node("/root/main/RigidBody2D")
var laser_scene = preload("res://laser.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.inscene = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_pos = player.position
	target_pos = (player_pos - position).normalized()
	velocity = target_pos * speed
	look_at(player_pos)
	if position.distance_to(player_pos) > 3:
		move_and_slide()
		if position.distance_to(player_pos) > 2000 && Global.inscene == false:
			shoot()
			Global.inscene = true
		


func _on_hitbox_area_entered(area):
	get_tree().paused = true
	get_node("/root/main/Player").hide()
	get_node("/root/main/RigidBody2D/AnimationPlayer").play("die")
	Global.deaths+=1


func shoot():
	if position.distance_to(player_pos) > 2000:
		var laser = laser_scene.instantiate()
		get_node("/root/main").add_child(laser)
		laser.position = position 
		laser.rotation = rotation
		laser.show()


