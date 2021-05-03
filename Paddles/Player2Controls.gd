extends KinematicBody2D

export (int) var speed = 250 
var velocity = Vector2()
const DEFAULT_X = 1000
const DEFAULT_Y = 300

func _ready():
	position.x = DEFAULT_X
	position.y = DEFAULT_Y
	pass
	
const MAX_Y_POS = 600
const MIN_Y_POS = 0
const PADDLE_OFFSET_UP = 90
const PADDLE_OFFSET_DOWN = 60

func get_input():
	velocity = Vector2() 
	if Input.is_action_pressed("player2_up") and position.y > MIN_Y_POS + PADDLE_OFFSET_UP:
		velocity.y -= 1
	if Input.is_action_pressed("player2_down") and position.y < MAX_Y_POS - PADDLE_OFFSET_DOWN:
		velocity.y += 1
	velocity = velocity.normalized() * speed
	
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	position.x = DEFAULT_X
