extends Node2D

func _ready() -> void:
	var config = ConfigFile.new()
	var err = config.load("user://save.cfg")
	var text = ""
	var save_round
	if err == OK:
		save_round = config.get_value("player", "current_round", 0)
		if save_round != 0:
			$UICanvas/Base/MarginContainer/VBoxContainer/ContinueButton.disabled = false
	else:
		text += "No save file found"
	print(text)
	pass

func on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
	pass

func on_quit_button_pressed():
	get_tree().quit()


func _on_continue_button_pressed():
	var config = ConfigFile.new()
	var err = config.load("user://save.cfg")
	var text = ""
	var save_coin
	var save_round
	var save_enemy1
	var save_enemy2
	var save_enemy3
	if err == OK:
		save_coin = config.get_value("player", "coins", 0)
		text += "Coins: " + str(save_coin)
		save_round = config.get_value("player", "current_round", 0)
		text += "\nCurrent Round: " + str(save_round)
		save_enemy1 = config.get_value("enemy", "enemy_1", -1)
		text += "\nEnemy 1 Value: " + str(save_enemy1)
		save_enemy2 = config.get_value("enemy", "enemy_2", -1)
		text += "\nEnemy 2 Value: " + str(save_enemy2)
		save_enemy3 = config.get_value("enemy", "enemy_3", -1)
		text += "\nEnemy 3 Value: " + str(save_enemy3)
		GameManager.load_save(save_coin, save_round, save_enemy1, save_enemy2, save_enemy3)
	else:
		text += "No save file found"
	print(text)
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
