extends RigidBody2D

export (int) var speed = 2 
export (float) var rotation_speed = 5
var rotation_dir = 0

var velocity = Vector2()

func _ready():
	# Default position
	position.x = 500
	position.y = 300
	

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("player2_up"):
		rotation_dir += 1
	if Input.is_action_pressed("player2_down"):
		rotation_dir -= 1
#	if Input.is_action_pressed("down"):
#		velocity = Vector2(-speed, 0).rotated(rotation)
#	if Input.is_action_pressed("up"):
#		velocity = Vector2(speed, 0).rotated(rotation)

func _integrate_forces(state):

func _physics_process(delta):
	get_input()
	velocity = Vector2(speed, 0).rotated(rotation)
	
	
	var collisions = move_and_collide(velocity)
	if collisions:
		# var n = collisions.normal		
		# velocity = n.reflect(velocity)
		rotation_dir = rotation * -1
	rotation += rotation_dir * rotation_speed * delta
		
