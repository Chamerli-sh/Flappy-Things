extends Area2D

const MOVE_SPEED = 200

func _process(delta):
	translate(Vector2.LEFT * delta * MOVE_SPEED) 

func _on_Pipe_body_entered(body):
	add_score()
	pass

func add_score():
	Global.add_score(1)
