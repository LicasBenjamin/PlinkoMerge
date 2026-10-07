extends Control

func _ready() -> void:
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionEasy.connect("enemy_selected", on_enemy_selected)
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionMedium.connect("enemy_selected", on_enemy_selected)
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionHard.connect("enemy_selected", on_enemy_selected)
	GameManager.round_ended.connect(on_round_ended)
	if GameManager.loaded:
		$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionEasy.set_target(GameManager.enemy_1_value)
		$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionMedium.set_target(GameManager.enemy_2_value)
		$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionHard.set_target(GameManager.enemy_3_value)

func on_enemy_selected(enemy: EnemyData):
	GameManager.start_round(enemy)

func on_round_ended():
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionEasy.scale_enemy()
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionMedium.scale_enemy()
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionHard.scale_enemy()
	GameManager.set_enemies($MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionEasy.get_target(), $MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionMedium.get_target(), $MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionHard.get_target())
