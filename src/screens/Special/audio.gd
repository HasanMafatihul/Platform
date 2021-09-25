extends Node

onready var ost = $ost
var turned = false
var volume = 100

var songDict = {
	"MainLevel0": "res://assets/song1.wav"
}

func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(volume/100))

func playSong(song: String):
	if turned:
		ost.stream.resource_path = songDict[song]
		ost.play()

func stopAll():
	ost.stop()
