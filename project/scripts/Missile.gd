extends KinematicBody2D

onready var player = get_node('../Player')

const SPEED = 50
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
func _fixed_process(delta):
#	var player = get_node('../Player')
#	print(player)
	print(player.get_pos())
	var target_pos = player.get_pos()
	target_pos.y = 72
	var direction = (target_pos - get_pos()).normalized()
	move(direction)
