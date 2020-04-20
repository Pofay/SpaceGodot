extends Area2D

# signal ship_hit

export var targetGroup = "enemies"
export var speed = 500
# Called when the node enters the scene tree for the first time.

func _ready():
	$Visibility.connect("screen_exited", self, "_on_exit")
	self.connect("body_entered", self , "_on_body_entered")
	pass

	
func _physics_process(delta):
	var motion = Vector2(1, 0) * speed
	position += motion * delta

func _on_exit():
	queue_free()
	pass

func _on_body_entered(body):
	if body.is_in_group(targetGroup):
		body.hit()
		queue_free()
	pass


