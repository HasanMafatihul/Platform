extends Area2D

export var obstacle_type = "Laser"
export var inac_path = preload("res://assets/laser_base_inactive.png")
var base_top:Sprite
var base_bot:Sprite
var active = true
var area:TextureRect

func deactivate():
	active = false
	set_deferred("monitorable", false)
	base_top.texture = inac_path
	base_bot.texture = inac_path
	area.visible = false

func _on_Timer_timeout():
	if (active):
		monitorable = !monitorable
		area.visible = monitorable
