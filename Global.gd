extends Node2D

var score = 0
var high_score = 0
var lost = false

func add_score(score):
	score += score

func get_score():
	return score

func get_hight_score(score):
	if score > high_score:
		high_score = score
	return high_score

func retry():
	get_tree().change_scene("res://World/World.tscn")
