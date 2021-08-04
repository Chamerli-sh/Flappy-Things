extends Area2D

const MOVE_SPEED = 200

func _process(delta):
	translate(Vector2.LEFT * delta * MOVE_SPEED) 
