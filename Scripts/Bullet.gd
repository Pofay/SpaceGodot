extends KinematicBody2D

# signal ship_hit

export var bulletSpeed = 600
var velocity = Vector2(bulletSpeed, 0)


# Called when the node enters the scene tree for the first time.

func _ready():
	pass



func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		EventSystem.emit_signal("enemy_ship_hit")
		queue_free()
	pass


