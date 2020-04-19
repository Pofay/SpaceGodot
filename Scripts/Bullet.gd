extends KinematicBody2D

# signal ship_hit

export var bulletSpeed = 600
export var targetGroup = "enemies"
var velocity = Vector2(bulletSpeed, 0)

# Called when the node enters the scene tree for the first time.

func _ready():
	$Visibility.connect("screen_exited", self, "_on_exit")
	pass

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var other = collision.collider
		if other.is_in_group(targetGroup):
			collision.collider.hit()
			queue_free()
	pass

func _on_exit():
	queue_free()
	pass

