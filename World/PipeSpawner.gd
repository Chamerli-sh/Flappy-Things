extends Node2D

onready var pipe_node = preload("res://Pipe/Pipe.tscn")
var y = 0
const MAX_Y = 132
const MIN_Y = -132

func spawn(y):
	var pipe = pipe_node.instance()
	add_child(pipe)
	pipe.global_position.y = y

func _on_Timer_timeout():
	y = rand_range(y - 128, y + 128)
	if y > MAX_Y:
		y = MAX_Y
	elif y < MIN_Y:
		y = MIN_Y
	else:
		spawn(y)
