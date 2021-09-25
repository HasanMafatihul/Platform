extends Node2D

export var difficulty_raise_time = 5
var p_pos = 0

func _ready():
	audio.playSong("MainLevel0")
	$LevelManager.player = $Player
	p_pos = $Player.position.x
	$LevelManager.bg = $bg3
	$MovingBoundary.player = $Player
	$MovingBoundary.speed = $Player.speed.x
	$Timer.wait_time = difficulty_raise_time
	
	#Testing Only
	$LevelManager/levels0.queue_free()

func _process(delta):
	if $Player.position.x > p_pos + 800:
		$bg3.rect_position.x += 800
		p_pos += 800
	$CanvasLayer/UI/Coins.text = str(stats.coins_collected)
