extends Button

var p1UpLabel
signal get_input(event)
var waitingForInput = false

func _ready():
	p1UpLabel = get_node("../UpBinding")

func _on_button_down():
	p1UpLabel.add_color_override("font_color", Color(255, 24, 24))    #font_color = Color(255, 24, 24) 
	p1UpLabel.text = "Press any key"
	waitingForInput = true
	var key = yield(self, "get_input")
	waitingForInput = false
	p1UpLabel.add_color_override("font_color", Color(255, 255, 255))
	p1UpLabel.text = OS.get_scancode_string(key.scancode)
	InputMap.action_erase_events("player1_up")
	InputMap.action_add_event("player1_up", key)

func _input(event):
	if waitingForInput:
		if event is InputEventKey:
			if event.pressed:
				emit_signal("get_input", event)

	
