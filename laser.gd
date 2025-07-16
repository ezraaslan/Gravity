extends CharacterBody2D

@onready var player = get_node("/root/main/RigidBody2D")
var player_pos
var target_pos
var speed = 5000
var done = false

func _ready():
	show()
	done = false
	scale.x = 1
	player_pos = player.position
	target_pos = (player_pos - position).normalized()
	velocity = target_pos * speed
	$Timer.start()
	
func _physics_process(delta):
	if done == false:
		position += transform.x * speed * delta
		look_at(player_pos)
		scale.x += .01

func _on_hitbox_area_entered(area):
	get_tree().paused = true
	get_node("/root/main/Player").hide()
	get_node("/root/main/RigidBody2D/AnimationPlayer").play("die")
	Global.deaths+=1


func _on_timer_timeout():
	done = true
	scale.x = 1
	$AnimationPlayer.play("explode")


func _on_animation_player_animation_finished(explode):
	queue_free()
	Global.inscene = false
	done = false
