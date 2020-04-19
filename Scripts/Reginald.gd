extends KinematicBody2D

export var health = 1
onready var Bullet = preload("res://Scenes/EnemyBullet.tscn")


func _ready():
	add_to_group("enemies")
	$Timer.connect("timeout", self, "_on_timeout")
	pass


func hit():
	print("Was Hit")
	health -= 1
	if health == 0:
		queue_free()
	pass

func _on_timeout():
	var b = Bullet.instance()
	b.position = position
	b.position.x -= 70 
	b.rotation = $Sprite.rotation
	get_parent().add_child(b)
	pass
