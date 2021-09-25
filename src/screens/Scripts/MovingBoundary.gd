extends Area2D

export var obstacle_type = "Boundary"

var speed = 0
var player:Node2D
var max_distance = 1100
var speed_multiplier = 0.2
var speed_multiplier_increment = 0.05
var max_speed_multipler = 0.7

func deactivate():
	set_deferred("monitorable", false)

func _process(delta):
	if player.position.x > position.x + max_distance:
		position.x += speed * delta * (player.position.x - position.x - max_distance)*0.05
	else:
		position.x += speed * delta * speed_multiplier


func _on_Timer_timeout():
	speed_multiplier += speed_multiplier_increment
	if speed_multiplier > max_speed_multipler:
		speed_multiplier = max_speed_multipler
	pass # Replace with function body.
