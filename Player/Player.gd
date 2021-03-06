extends KinematicBody2D

const UP = Vector2(0, -1)
const MAX_FALL_SPEED = 300
const JUMP_SPEED = 350
const GRAVITY = 20

var motion : Vector2
onready var jump_sound = get_node("JumpSoundEffect")
onready var anim_player = get_node("AnimationPlayer")

func _ready():
	anim_player.play("Turn")


func _physics_process(delta):
	if Input.is_action_just_released("jump") and Global.lost == false:
		motion.y = -JUMP_SPEED
		jump_sound.play()
	
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
	anim_player.stop()
	get_tree().get_current_scene().die()


func _on_AnimationPlayer_animation_finished(anim_name):
	anim_player.play(anim_name)
