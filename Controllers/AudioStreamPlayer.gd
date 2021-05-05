extends AudioStreamPlayer

func play_sound():
	if self.playing == false:
		self.play()
