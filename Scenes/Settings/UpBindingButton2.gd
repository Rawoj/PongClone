extends Button

var p2UpLabel
signal get_input(event)
var waitingForInput = false

func _ready():
	p2UpLabel = get_node("../UpBinding")

func _on_button_down():
	p2UpLabel.text = "Press any key"
	waitingForInput = true
	var key = yield(self, "get_input")
	waitingForInput = false
	p2UpLabel.text = OS.get_scancode_string(key.scancode)
	InputMap.action_erase_events("player2_up")
	InputMap.action_add_event("player2_up", key)

func _input(event):
	if waitingForInput:
		if event is InputEventKey:
			if event.pressed:
				emit_signal("get_input", event)

	
