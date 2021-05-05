extends Node2D

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		self.get_tree().get_root().remove_child(self)
	pass
