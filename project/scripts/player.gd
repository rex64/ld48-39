extends KinematicBody2D


var speed = Vector2()
var velocity = Vector2()

const WALKING = false 
const WALK_SPEED = 50
const JUMP = 70
const GRAVITY = 200

signal player_move

func _ready():
	set_process(true)
	set_fixed_process(true)

func _process(delta):
	pass

func _fixed_process(delta):

	if Input.is_action_pressed("jump"):
		velocity.y = -JUMP

	velocity.y += delta * GRAVITY
#	if (Input.is_action_pressed("ui_left")):
#		velocity.x = - WALK_SPEED
#	elif (Input.is_action_pressed("ui_right")):
#		velocity.x =   WALK_SPEED
#	else:
	velocity.x = WALK_SPEED

	var motion = velocity * delta
	motion = move(motion)

	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)
