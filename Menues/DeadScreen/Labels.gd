extends Control


onready var score_label_node = get_node("ScoreLabel")
onready var height_label_node = get_node("HeightScoreLable")


func display_score():
	score_label_node.text = "Score: " + str(Global.score)
	height_label_node.text = "Height Score: " + str(Global.high_score)
