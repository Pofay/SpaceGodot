extends KinematicBody2D


export var playerSpeed = 800
export var health = 3
var velocity = Vector2()

onready var Bullet = preload("res://Scenes/PlayerBullet.tscn")

func _ready():
	add_to_group("player")
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			shoot()


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

func shoot():
	var b = Bullet.instance()
	b.position = position
	b.position.x += 50 
	get_parent().add_child(b)

func hit():
	health -= 1
	if health == 0:
		queue_free()
	pass



