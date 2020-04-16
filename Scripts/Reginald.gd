extends KinematicBody2D

export var health = 1

func _ready():
	add_to_group("enemies")
	pass


func hit():
	print("Was Hit")
	health -= 1
	if health == 0:
		queue_free()
	pass
