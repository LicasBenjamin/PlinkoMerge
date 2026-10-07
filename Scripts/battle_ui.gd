extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.update_UI.connect(on_update_UI)
	GameManager.chip_spawned.connect(on_chip_spawned)

func on_update_UI(current_score : int, target_score : int):
	$BeatScore.text = str(target_score)
	$CurrentScore.text = str(current_score)

func on_chip_spawned():
	$ChipCount.text = str(GameManager.remaining_chips)
