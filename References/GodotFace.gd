extends KinematicBody2D


var move_speed = 200
var velocity = Vector2()
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
	


func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x=-move_speed
		
	if Input.is_action_pressed("ui_right"):
		velocity.x=move_speed
		
	if Input.is_action_pressed("ui_down"):
		velocity.y=move_speed
		
	if Input.is_action_pressed("ui_up"):
		velocity.y=-move_speed
		
		
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		shoot()
		
	

func shoot():
	#spawn a projectile
	
	var projectile = load("res://Scenes/Projectile.tscn")
	var bullet = projectile.instance()
	add_child_below_node(get_tree().get_root().get_node("Game"),bullet)
