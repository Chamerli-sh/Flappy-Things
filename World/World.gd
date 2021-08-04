extends Node2D

onready var score_label = $Control/Label

func _process(delta):
	score_label.set_text("Score: " + str(Global.score))
