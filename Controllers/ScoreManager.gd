extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var p1Score = 0
var p2Score = 0

# Called when the node enters the scene tree for the first time.
var ball
func _ready():
	ball = get_node(@"/root/Scene/Ball/Area2D")
	# var signals = ball.get_signal_connection_list("goal")
	var _goalSignal = ball.connect("goal", self, "_on_ball_goal")
	update_scoreboard()

func _on_ball_goal(player):
	change_score(player)
	update_scoreboard()

func reset():
	p1Score = 0
	p2Score = 0
	update_scoreboard()

func update_scoreboard():
	# print("Updating scoreboard")
	var p1Board = get_node(@"./P1Score")
	var p2Board = get_node(@"./P2Score")
	if p1Board == null or p2Board == null:
		print("Board not found")
	p1Board.text = String(p1Score)
	p2Board.text = String(p2Score)

	
func change_score(player):
	if player == 1:
		p1Score += 1
	elif player == 2:
		p2Score += 1
	else:
		print("ERROR: Invalid player @ ScoreManager")
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass
