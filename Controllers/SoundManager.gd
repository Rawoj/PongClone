extends Node

var ball
var hitAudioPlayer
var goalAudioPlayer
var boundHitAudioPlayer

func _ready():
	ball = get_node(@"/root/Scene/Ball/Area2D")
	hitAudioPlayer = $HitAudioPlayer
	goalAudioPlayer = $GoalAudioPlayer
	boundHitAudioPlayer = $BoundHitAudioPlayer
	# var signals = ball.get_signal_connection_list("hit")
	var _hitSignal = ball.connect("hit", self, "_on_ball_hit")
	var _goalSignal = ball.connect("goal", self, "_on_ball_goal")
	var _boundHitSignal = ball.connect("boundHit", self, "_on_ball_bound_hit")

func _on_ball_hit():
	hitAudioPlayer.play_sound()

func _on_ball_goal(_player):
	goalAudioPlayer.play_sound()

func _on_ball_bound_hit():
	boundHitAudioPlayer.play_sound()
