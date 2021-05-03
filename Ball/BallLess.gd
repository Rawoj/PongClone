extends Area2D

signal hit
const DEFAULT_SPEED = 400

var direction = Vector2.LEFT

onready var _initial_pos = position
onready var _speed = DEFAULT_SPEED

const DEFAULT_POS = Vector2(500, 300)
const BOUND_POS_Y = [590, 10]

func _ready():
	# Default position
	position = DEFAULT_POS
	
func reflect():
	direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()	
func reflectX():
	direction = Vector2(-direction.x, randf() * 2 - 1).normalized()	
func reflectY():
	direction = Vector2(direction.x, -direction.y).normalized()	
	
func is_in_bounds():
	#print(position.y, BOUND_POS_Y)
	if position.y >= BOUND_POS_Y[0]:
		reflectY()
		position.y = BOUND_POS_Y[0]
	if position.y <= BOUND_POS_Y[1]:
		reflectY()
		position.y = BOUND_POS_Y[1]

func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction
	is_in_bounds()

func reset():
	direction = Vector2.LEFT
	position = _initial_pos
	_speed = DEFAULT_SPEED
	
	
func _on_body_entered(_body):
	emit_signal("hit")
	reflectX()
