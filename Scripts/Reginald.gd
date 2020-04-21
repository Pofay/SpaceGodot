extends KinematicBody2D

export var health = 1
export var shipSpeed = 25 
var velocity = Vector2()
onready var Bullet = preload("res://Scenes/EnemyBullet.tscn")


func _ready():
	add_to_group("enemies")
	$Timer.connect("timeout", self, "_on_timeout")
	$Visibility.connect("screen_exited", self, "_on_exit")
	pass

func _physics_process(delta):
	velocity = Vector2()
	velocity.x = -1
	velocity = velocity.normalized() * shipSpeed
	velocity = move_and_slide(velocity)
	pass

func hit():
	print("Was Hit")
	health -= 1
	if health == 0:
		EventSystem.emit_signal("shipDeath")
		$CollisionShape2D.queue_free()
		$Sprite.visible = false
		$DeathAnimation.visible = true
		$DeathAnimation.play("death")
		$Timer.disconnect("timeout",self, "_on_timeout")
		yield(get_tree().create_timer(1.0), "timeout")
		queue_free()
	pass

func _on_timeout():
	shoot()
	pass

func shoot():
	var b = Bullet.instance()
	b.position = position
	b.position.x -= 70 
	get_parent().add_child(b)
	pass

func _on_exit():
	print("Exited Screen: Deleting..")
	queue_free()
	pass
