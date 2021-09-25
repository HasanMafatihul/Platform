extends Node2D

var player

func _process(delta):
	if player.position.x > self.position.x + 2480 + 1240:
		queue_free()
