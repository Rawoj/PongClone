extends AudioStreamPlayer

var audioNode = null
var manager = null

func _ready():
	audioNode = self
	audioNode.connect("finished", self, "sound_finished")
	audioNode.stop()
	manager = get_node(@"/root/Scene/GameController/SoundManager")


func play_sound(audioStream):
	if audioStream == null:
		print ("No audio stream found")
		manager.createdAudio.remove(manager.createdAudio.find(self))
		queue_free()
		return
	audioNode.stream = audioStream
	audioNode.play(0.0)

func sound_finished():
	manager.createdAudio.remove(manager.createdAudio.find(self))
	audioNode.stop()
	queue_free()


func _on_AudioStreamPlayer_finished():
	pass # Replace with function body.
