extends Panel

@export var pause_button : Button

func _ready() -> void:
	GameManager.notify_loss.connect(on_lost_game)

func on_lost_game():
	visible = true
	pause_button.visible = false
