extends Node2D

func _process(delta):
	var time = randf_range(0, 10)
	await get_tree().create_timer(time).timeout
	$AnimationPlayer.play("move")

func _on_hitbox_area_entered(area):
	get_tree().paused = true
	get_node("/root/main/Player").hide()
	get_node("/root/main/RigidBody2D/AnimationPlayer").play("die")
	Global.deaths += 1
	Global.time = 0
