extends Node2D

func _on_BackButton_button_down():
	self.get_tree().get_root().remove_child(self)
	pass # Replace with function body.
