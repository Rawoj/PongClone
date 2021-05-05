extends AudioStreamPlayer

func _ready():
	pass

func play_sound():
	if self.playing == false:
		self.play()
