extends Panel

func toggle_pause_menu():
	visible = false if visible else true

func return_to_menu():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

func save_and_quit():
	#needs to save the coins, round number, enemy values, later on shop unlocks, and inventory unlocks
	var config = ConfigFile.new()
	config.set_value("player", "coins", Currency.coin)
	#Saving in the middle of a game resets to before that round
	config.set_value("player", "current_round", GameManager.current_round if GameManager.current_state == GameManager.State.Idle else GameManager.current_round - 1)
	config.set_value("enemy", "enemy_1", GameManager.enemy_1_value)
	config.set_value("enemy", "enemy_2", GameManager.enemy_2_value)
	config.set_value("enemy", "enemy_3", GameManager.enemy_3_value)
	config.save("user://save.cfg")
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

#func save_data():
#	var config = ConfigFile.new()
#	config.set_value("player", "coins", coins)
#	config.set_value("player", "highest_round", highest_round)
#	config.save("user://save.cfg")

#func load_data():
#	var config = ConfigFile.new()
#	var err = config.load("user://save.cfg")
#	if err == OK:
#		coins = config.get_value("player", "coins", 0)
#		highest_round = config.get_value("player", "highest_round", 1)
