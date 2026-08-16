extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.update_UI.connect(on_update_UI)
	

func on_update_UI(current_score : int, target_score : int):
	$BeatScore.text = str(target_score)
	$CurrentScore.text = str(current_score)
