extends KinematicBody2D



export var bulletSpeed = 600
var velocity = Vector2(bulletSpeed, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	print('Wassap!')
	pass # Replace with function body.



func _physics_process(delta):
	move_and_collide(velocity * delta)
	pass


