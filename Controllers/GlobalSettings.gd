extends Node

onready var volumeDecButton = get_node(@"../Sounds/Volume/MinusButton").connect("volumeChange", self, "_on_volume_change")
onready var volumeIncButton = get_node(@"../Sounds/Volume/PlusButton") .connect("volumeChange", self, "_on_volume_change")


func linear_to_db(x):
	# Assuming 0 - 100 value range
	return log(x) * 20 - 90

func _on_volume_change(val):
	if val == 0:
		AudioServer.set_bus_mute(0, true)		
	else:
		AudioServer.set_bus_mute(0, false)
		AudioServer.set_bus_volume_db(0, linear_to_db(val))
	pass

