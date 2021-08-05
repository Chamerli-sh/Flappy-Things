extends Control


onready var score_label_node = get_node("ScoreLabel")
onready var height_label_node = get_node("HeightScoreLable")


func _draw():
	score_label_node.text = "Your current score is" + str(Global.score)
	height_label_node.text = "Your current height score is" + str(Global.high_score)
