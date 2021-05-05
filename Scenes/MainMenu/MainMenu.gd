extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var settingsScene = preload("res://Scenes/Settings.tscn").instance()
var gameScene = preload("res://Scenes/Game.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_settings_button_down():
	self.get_tree().get_root().add_child(settingsScene)
	pass 


func _on_PVP_button_down():
	self.get_tree().get_root().add_child(gameScene)
	#var _err = self.get_tree().change_scene_to(self.gameScene) 
	pass
