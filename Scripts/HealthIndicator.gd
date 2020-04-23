extends Control

export var maxHealth = 3

func _ready():
	$HealthValue.text = String(maxHealth)
	EventSystem.connect("health_changed", self, "_on_health_changed")

func _on_health_changed(health):
	$HealthValue.text = String(health)
