extends Control

func _ready():
	visible = get_tree().paused

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused

func _on_ResumeButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused

func _on_QuitButton_pressed():
	get_tree().quit()

