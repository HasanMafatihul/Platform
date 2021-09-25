extends TextureRect

var bottom:TextureRect
var top:TextureRect
var direction = false
var speed = 250
var per = 0.1
var pause = false
var timer:Timer

func _process(delta):
	if(!pause):
		var rel_speed = speed * per
		if direction:
			rect_position.y += speed * delta
		else:
			rect_position.y -= speed * delta
		if rect_position.y <= top.rect_position.y:
			direction = true
			pause_move()
		if rect_position.y >= bottom.rect_position.y:
			direction = false
			pause_move()

func pause_move():
	pause = true
	timer.start(3)

func _on_Timer_timeout():
	pause = false
