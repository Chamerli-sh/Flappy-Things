extends Node2D

onready var pipe_node = preload("res://Pipe/Pipe.tscn")
var y = 0

func spawn(y):
	var pipe = pipe_node.instance()
	add_child(pipe)
	pipe.global_position.y = y

func _on_Timer_timeout():
	y = rand_range(y - 64, y + 64)
	spawn(y)
	print(y)
