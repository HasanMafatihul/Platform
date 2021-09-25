extends Node2D

var levelList = []
var levelNumber = 5
var player:KinematicBody2D
var random = RandomNumberGenerator.new()
var bg:TextureRect

const distance = 2480
var x_spawn = distance

func _ready():
	for i in levelNumber:
		levelList.append(load(str("res://src/levels/level", i, ".tscn")))
	stats.coins_collected = 0

func _process(delta):
	if player.position.x >= 1650 + x_spawn - distance:
		loadLevel()
#		bg.rect_position.x += 1650

func loadLevel():
	random.randomize()
	var level_inst: Node2D = levelList[random.randi_range(0, levelNumber-1)].instance()
	level_inst.transform.origin = Vector2(x_spawn,0)
	level_inst.player = player
	self.add_child(level_inst)
	x_spawn += distance
