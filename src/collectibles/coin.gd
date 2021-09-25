extends Area2D

export var random = 70

func _ready():
	if rand_range(0,100)<random:
		queue_free()

func _on_Coin_body_entered(body):
	stats.coins_collected += 1
	self.queue_free()
