extends Button
signal volumeChange
var volumeLabel

func _ready():
	volumeLabel = get_node("../VolumeValue")

func _on_button_down():
	var val = int(volumeLabel.text)
	if val < 100:
		val += 10
	volumeLabel.text = String(val)
	emit_signal("volumeChange", val)
