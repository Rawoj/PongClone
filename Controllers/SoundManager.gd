extends Node

var ball
var createdAudio = []
var audioClips = {
	"hit":null, #preload("res://Sounds/bounce.wav")
	"goal":null, #preload("res://Sounds/goal.wav")
}

func play_sound(soundName):
	if audioClips.has(soundName):
		var AudioPlayer = $AudioStreamPlayer
		#add_child(AudioPlayer)
		#createdAudio.append(AudioPlayer)
		AudioPlayer.play_sound(audioClips[soundName])

func _ready():
	ball = get_node(@"/root/Scene/Ball/Area2D")
	# var signals = ball.get_signal_connection_list("hit")
	var _hitSignal = ball.connect("hit", self, "_on_ball_hit")
	var _goalSignal = ball.connect("goal", self, "_on_ball_goal")

func _on_ball_hit():
	play_sound(audioClips.hit)
	pass
func _on_ball_goal(_player):
	play_sound(audioClips.goal)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass

