extends Node2D

var map_length = 0
onready var player = get_node("../Player")
const SPEED = 1

func _ready():
	set_fixed_process(true)
	for i in range(100):
		add_floor()
	
func _fixed_process(delta):
#	print(player.get_pos().x)
	pass
#	for child_node in get_children():
#		child_node.move(Vector2(0.2,0))

func add_floor():
	var floor_0 = preload("res://entities/floor_0.tscn")
	var node = floor_0.instance()
	node.set_pos(Vector2(map_length,84))
	map_length += 64
	add_child(node)