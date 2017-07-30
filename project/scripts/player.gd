extends KinematicBody2D


var speed = Vector2()
var velocity = Vector2()
var jumping = false

const WALKING = false 
const WALK_SPEED = 50
const JUMP = 100
const GRAVITY = 200

signal player_move

var whip_r = null

func _ready():
	set_process(true)
	set_fixed_process(true)

func _process(delta):

	if Input.is_action_pressed("ui_right"):
		var floor_0 = preload("res://entities/Whip_R.tscn")
		whip_r = floor_0.instance()
		add_child(whip_r)
	elif Input.is_action_pressed("ui_right"):
		pass
	elif Input.is_action_pressed("ui_right"):
		pass
	elif Input.is_action_pressed("ui_right"):
		pass
	else:
		if whip_r:
#			remove_and_delete_child(whip_r)
#			whip_r.free()
			whip_r.queue_free()
			whip_r = null
		

func _fixed_process(delta):

	if not jumping and Input.is_action_pressed("jump"):
		velocity.y = -JUMP
		jumping = true

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
		
		if get_collider().is_in_group('projectile'):
			print('game over')
			get_tree().set_pause(true)
		
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)
		jumping = false
