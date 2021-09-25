extends Control
export var speed = 3

func _ready():
	$Spike.top = $top
	$Spike.bottom = $bottom
	$Spike.timer = $Timer
