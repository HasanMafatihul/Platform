extends Area2D

export var obstacle_type = "Spike"
var inac_path = preload("res://assets/spike_inactive.png")
var rng = RandomNumberGenerator.new()
export var random_val = 70

func _ready():
	rng.randomize()
	if rng.randi_range(0,100) >= random_val:
		queue_free()

func deactivate():
	set_deferred("monitorable", false)
	$Sprite.texture = inac_path
