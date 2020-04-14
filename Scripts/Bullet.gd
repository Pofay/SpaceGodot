extends RigidBody2D


export var bulletSpeed = 600
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	velocity.y += 1
	velocity = velocity.normalized() * bulletSpeed
	pass
