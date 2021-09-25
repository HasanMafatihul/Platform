extends Control
export var time = 1
var rng = RandomNumberGenerator.new()
export var random = 80

func _ready():
	$Timer.wait_time = time
	$MarginContainer/LaserCollide.base_top = $VBoxContainer/laser_base
	$MarginContainer/LaserCollide.base_bot = $VBoxContainer2/laser_base
	$MarginContainer/LaserCollide.area = $laser_area
	$MarginContainer/LaserCollide/CollisionShape2D.shape.extents.y = $laser_area.rect_size.y/2 - 10
	rng.randomize()
	if rng.randi_range(0,100) >= random:
		queue_free()
