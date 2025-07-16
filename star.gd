extends Area2D

func _on_area_entered(area):
	Global.stars += 1
	queue_free()
