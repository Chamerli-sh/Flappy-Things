extends Node2D

onready var pipe_node = preload("res://Pipe/Pipe.tscn")

func spawn():
	var pipe = pipe_node.instance()
	add_child(pipe)

func _on_Timer_timeout():
	spawn()
	print("Hello World!")
