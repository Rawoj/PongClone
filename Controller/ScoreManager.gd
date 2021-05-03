extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var p1Score = 0
var p2Score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func reset():
	p1Score = 0
	p2Score = 0
	update_scoreboard()

func update_scoreboard():
	
	pass
	
func change_score(player):
	if player == 1:
		p1Score += 1
	else if player == 2:
		p2Score += 1
	else:
		print("ERROR: Invalid player @ ScoreManager")
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
