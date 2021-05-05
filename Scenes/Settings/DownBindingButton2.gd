extends Button

var p2DownLabel
signal get_input(event)
var waitingForInput = false

func _ready():
	p2DownLabel = get_node("../DownBinding")

func _on_button_down():
	p2DownLabel.text = "Press any key"
	waitingForInput = true
	var key = yield(self, "get_input")
	waitingForInput = false
	p2DownLabel.text = OS.get_scancode_string(key.scancode)
	InputMap.action_erase_events("player2_down")
	InputMap.action_add_event("player2_down", key)

func _input(event):
	if waitingForInput:
		if event is InputEventKey:
			if event.pressed:
				emit_signal("get_input", event)

	
