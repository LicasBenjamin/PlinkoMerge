extends Node2D

func _ready() -> void:
	var config = ConfigFile.new()
	var err = config.load("user://save.cfg")
	var text = ""
	if err == OK:
		text += "Coins: " + str(config.get_value("player", "coins", 0))
		text += "\nCurrent Round: " + str(config.get_value("player", "current_round", 0))
		text += "\nEnemy 1 Value: " + str(config.get_value("enemy", "enemy_1", -1))
		text += "\nEnemy 2 Value: " + str(config.get_value("enemy", "enemy_2", -1))
		text += "\nEnemy 3 Value: " + str(config.get_value("enemy", "enemy_3", -1))
	else:
		text += "No save file found"
	print(text)
	pass

#func load_data():
#	var config = ConfigFile.new()
#	var err = config.load("user://save.cfg")
#	if err == OK:
#		coins = config.get_value("player", "coins", 0)
#		highest_round = config.get_value("player", "highest_round", 1)

func on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
	pass

func on_quit_button_pressed():
	get_tree().quit()
