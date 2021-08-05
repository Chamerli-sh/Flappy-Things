extends Node2D

onready var score_label = $Control/Label
onready var explosion_particle = preload("res://Particles/ExplosionParticle.tscn")
onready var player_node = get_node("Player")
var explosion

func _ready():
	explosion = explosion_particle.instance()

func _process(delta):
	score_label.set_text("Score: " + str(Global.score))



func die():

	add_child(explosion)
	explosion.global_position = player_node.global_position
