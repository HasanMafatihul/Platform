extends Node2D

func _process(delta):
	$CanvasLayer/UI/Coins.text = str(stats.coins_collected)

func _on_Area2D_body_entered(body):
	$Player.cancer = 10

func _on_MovingBoundary_body_entered(body):
	global.goto_scene("res://src/screens/MainMenu.tscn")
