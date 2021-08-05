extends KinematicBody2D

const UP = Vector2(0, -1)
const MAX_FALL_SPEED = 300
const JUMP_SPEED = 350
const GRAVITY = 20

var motion : Vector2

func _physics_process(delta):
	if Input.is_action_just_released("jump") and not Global.lost:
		motion.y = -JUMP_SPEED
	
	motion.y += GRAVITY
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED
	
	motion = move_and_slide(motion, UP) 
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("Pipe"):
			die()

func die():
	print("Game Over")
	print("Your current hight score is: " + str(Global.get_hight_score(Global.score)))
	Global.score = 0
	Global.lost = true
	get_tree().get_current_scene().die()
