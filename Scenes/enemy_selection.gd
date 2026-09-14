extends Control

func _ready() -> void:
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionEasy.connect("enemy_selected", on_enemy_selected)
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionMedium.connect("enemy_selected", on_enemy_selected)
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionHard.connect("enemy_selected", on_enemy_selected)
	

func on_enemy_selected(enemy: EnemyData):
	GameManager.start_round(enemy)

func next_round_button_pressed():
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionEasy.scale_enemy()
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionMedium.scale_enemy()
	$MarginContainer/VBoxContainer/HBoxContainer/EnemyOptionHard.scale_enemy()
