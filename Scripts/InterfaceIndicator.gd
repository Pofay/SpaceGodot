extends Control

export var maxHealth = 3
var totalScore = 0

func _ready():
	$HealthValue.text = String(maxHealth)
	$ScoreValue.text = String(totalScore)
	EventSystem.connect("health_changed", self, "_on_health_changed")
	EventSystem.connect("award_score", self, "_on_award_score")

func _on_health_changed(health):
	$HealthValue.text = String(health)

func _on_award_score(score):
	totalScore += score
	$ScoreValue.text = String(totalScore)
