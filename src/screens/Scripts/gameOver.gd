extends Control

onready var stats = get_node("/root/stats")

func _ready():
	var distance = stepify(stats.distance_travelled/100, 0.1) - 2.8
	$VBoxContainer/distance.text = str("Distance Travelled : ", distance, " meter")
	$VBoxContainer/coins.text = str("Coins Collected : ", stats.coins_collected)
