extends Node2D

func _on_BackButton_button_down():
	self.get_tree().get_root().remove_child(self)

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		self.get_tree().get_root().remove_child(self)
