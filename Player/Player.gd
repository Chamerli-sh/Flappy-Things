extends KinematicBody2D

const UP = Vector2(0, -1)
const MAX_FALL_SPEED = 300
const JUMP_SPEED = 350
const GRAVITY = 20

var motion : Vector2

func _physics_process(delta):
	if Input.is_action_just_pressed("jump") and Global.lost == false:
		motion.y = -JUMP_SPEED
	
	motion.y += GRAVITY
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED
	
	motion = move_and_slide(motion, UP) 
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("Pipe"):
			if !Global.lost:
				die()

func die():
	print("Game Over")
	print("Your current hight score is: " + str(Global.get_hight_score(Global.score)))
	Global.lost = true
	get_tree().get_current_scene().die()
