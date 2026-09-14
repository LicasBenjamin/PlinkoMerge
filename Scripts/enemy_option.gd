extends Button

signal enemy_selected(enemy: EnemyData)

@export var enemy_data : EnemyData

func _ready() -> void:
	apply_data()

func apply_data():
	$VBoxContainer/DifficultyLabel.text = enemy_data.difficulty_to_string()
	$VBoxContainer/ScoreLabel.text = str(enemy_data.target_score)

func _pressed() -> void:
	enemy_selected.emit(enemy_data)

func scale_enemy():
	enemy_data.target_score += GameManager.target_score
	apply_data()
