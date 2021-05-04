extends Area2D

signal hit
signal goal(player)


const DEFAULT_SPEED = 200
const SPEED_INCREASE_RATE = 10
var direction = Vector2.LEFT

onready var _speed = DEFAULT_SPEED

const DEFAULT_POS = Vector2(500, 300)
const BOUND_POS_Y = [590, 10]
const BOUND_POS_X = [-50, 1075]
var manager
func _ready():
	position = DEFAULT_POS
	
func reflectRandom():
	direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()	
func reflectX():
	direction = Vector2(-direction.x, randf() * 2 - 1).normalized()	
func reflectY():
	direction = Vector2(direction.x, -direction.y).normalized()	
	
func keep_in_bounds():
	#print(position.y, BOUND_POS_Y)
	if position.y >= BOUND_POS_Y[0]:
		reflectY()
		position.y = BOUND_POS_Y[0]
	if position.y <= BOUND_POS_Y[1]:
		reflectY()
		position.y = BOUND_POS_Y[1]

func _on_Area2D_goal(_player):
	pass # Replace with function body.
	
func detect_goals():
	# print("detecting", BOUND_POS_X)
	# P2 goal
	if position.x <= BOUND_POS_X[0]:
		emit_signal("goal", 2)
		# get_node("GameController/ScoreManager").call("change_score(2)")
		reset(Vector2.LEFT)
	# P1 goal
	if position.x >= BOUND_POS_X[1]:
		emit_signal("goal", 1)
		# get_node("GameController/ScoreManager").call("change_score(1)")
		reset(Vector2.RIGHT)


func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction
	keep_in_bounds()
	detect_goals()

func reset(dir):
	direction = dir
	position = DEFAULT_POS
	_speed = DEFAULT_SPEED
	

func _on_body_entered(_body):
	emit_signal("hit")
	_speed += SPEED_INCREASE_RATE
	reflectX()



