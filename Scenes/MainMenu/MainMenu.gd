extends Node2D

var settingsScene = preload("res://Scenes/Settings.tscn").instance()
var gameScene = preload("res://Scenes/Game.tscn").instance()
var gameBotScene = preload("res://Scenes/GameBot.tscn").instance()

func _on_settings_button_down():
	self.get_tree().get_root().add_child(settingsScene)

func _on_PVP_button_down():
	self.get_tree().get_root().add_child(gameScene)

func _on_PVE_button_down():
	self.get_tree().get_root().add_child(gameBotScene)
