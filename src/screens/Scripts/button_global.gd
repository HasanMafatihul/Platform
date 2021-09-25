extends Node

export var path:String

func _pressed():
	global.goto_scene(path)
