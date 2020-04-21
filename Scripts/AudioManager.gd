extends Node2D


func _ready():
	EventSystem.connect("shipDeath", self, "_on_ship_death")
	pass # Replace with function body.

func _on_ship_death():
	$DeathSound.play()
	pass


