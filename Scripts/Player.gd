extends KinematicBody2D


export var playerSpeed = 800
var velocity = Vector2()

func _ready():
	pass


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
	velocity = velocity.normalized() * playerSpeed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)


