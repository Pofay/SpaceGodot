extends KinematicBody2D

export var health = 1

func _ready():
	EventSystem.connect("enemy_ship_hit", self, "_on_ship_hit")
	pass


func _on_ship_hit():
	health -= 1
	if(health == 0):
		queue_free()
	pass
