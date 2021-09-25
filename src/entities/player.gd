extends Actor

onready var hpOver = $HP/hpOverload
onready var hpNorm = $HP/hpNormal
onready var stats = get_node("/root/stats")
onready var hit_particle = preload("res://src/entities/In/HitParticle.tscn")

export var hp = 100
export var cancer = 2
var cancer_max = 25
export var cancer_increment = 1
var max_distance = 0

var save_frame = 0

#func _ready():
#	$AnimationPlayer.play("health_over")

func _process(delta):
	hpOver.visible = false
	hpNorm.value = hp
	hpOver.value = hp
	$HP/overSprite.visible = false
	if hp > 100:
		hpOver.visible = true
		$AnimationPlayer.play("health_over")
		$AnimationPlayer.playback_speed = 1 + ((hp - 100)/100)
		$HP/overSprite.visible = true
	else:
		$AnimationPlayer.stop()
	hp += cancer * delta
	$HP/hpLabel.text = str(round(hp))+"%"
	if hp <= 0 or hp >= 200:
		die()
	if position.x > max_distance: max_distance = position.x

func _physics_process(delta):
	var direction
	save_frame -= delta
	if is_on_floor():
		direction = get_direction(true)
		save_frame = 0.1
	else: if save_frame > 0:
		direction = get_direction(true)
	else:
		direction = get_direction(false)
	if direction.y == -1.0:
		save_frame = 0
	velocity = calculate_move_velocity(velocity, direction, speed)
	velocity = move_and_slide(velocity, Vector2.UP)

func get_direction(on_floor:bool):
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and on_floor else 1.0
	)

func calculate_move_velocity(linear_vel:Vector2, direction_t:Vector2, speed_t:Vector2) -> Vector2:
	var new_velocity = linear_vel
	new_velocity.x = speed.x * direction_t.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction_t.y == -1.0:
		new_velocity.y = speed_t.y * direction_t.y
	return new_velocity

func _on_Obstacles_entered(area):
	play_particle("HitParticle")
	match area.obstacle_type:
		"Spike":
			hp -= 15
		"Laser":
			hp -= 20
		"Boundary":
			die()
	area.deactivate()

func _on_Timer_timeout():
	cancer += cancer_increment
	if cancer > cancer_max: cancer = cancer_max

func die():
	stats.distance_travelled = max_distance
	global.goto_scene("res://src/screens/gameOver.tscn")
	audio.stopAll()

func play_particle(particle: String):
	match particle:
		"HitParticle":
			var GrabedInstance = hit_particle.instance()
			GrabedInstance.emitting = true
			self.add_child(GrabedInstance)
