extends KinematicBody2D

const UP = Vector2(0, -1)
const MAX_FALL_SPEED = 200
const JUMP_SPEED = 200
const GRAVITY = 10


var motion : Vector2

func _physics_process(delta):
	if Input.is_action_just_released("jump"):
		motion.y = -JUMP_SPEED
	
	motion.y += GRAVITY
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED
	
	motion = move_and_slide(motion, UP) 
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("Pipe"):
			get_tree().change_scene("res://World/World.tscn")
			print("Game Over")
	
