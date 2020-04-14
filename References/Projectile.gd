extends KinematicBody2D

var velocity = Vector2()

func _ready():
    velocity.y = -600

func _physics_process(delta):
    move_and_slide(velocity)
    pass
