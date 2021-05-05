extends KinematicBody2D

export (int) var speed = 280 
var velocity = Vector2()
const DEFAULT_X = 1000
const DEFAULT_Y = 300
var ball

func _ready():
	ball = get_node(@"/root/Scene/Ball/Area2D")
	position.x = DEFAULT_X
	position.y = DEFAULT_Y
	pass
	
const MAX_Y_POS = 600
const MIN_Y_POS = 0
const PADDLE_OFFSET_UP = 90
const PADDLE_OFFSET_DOWN = 60
const PADDLE_RANGE = 27

func move():
	velocity = Vector2() 
	if ball.position.y < position.y + PADDLE_RANGE and position.y > MIN_Y_POS + PADDLE_OFFSET_UP:
		velocity.y -= 1
	if ball.position.y > position.y - PADDLE_RANGE and position.y < MAX_Y_POS - PADDLE_OFFSET_DOWN:
		velocity.y += 1
	velocity = velocity.normalized() * speed
	
func _physics_process(_delta):
	move()
	velocity = move_and_slide(velocity)
	position.x = DEFAULT_X
