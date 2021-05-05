extends AudioStreamPlayer

var minusButton
var plusButton
func _ready():
	minusButton = get_node("../MinusButton")
	plusButton = get_node("../PlusButton")
	# var signals = ball.get_signal_connection_list("hit")
	var _volumeDec = minusButton.connect("volumeChange", self, "_on_volume_change")
	var _volumeInc = plusButton.connect("volumeChange", self, "_on_volume_change")
	
func _on_volume_change(_d):
	self.play()
	pass
