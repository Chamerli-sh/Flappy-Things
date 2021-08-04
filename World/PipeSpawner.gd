extends Node2D

onready var pipe_node = preload("res://Pipe/Pipe.tscn")

func spawn(y):
	var pipe = pipe_node.instance()
	add_child(pipe)
	pipe.global_position.y = y

func _on_Timer_timeout():
	var y = rand_range(-64, 64)
	spawn(y)
