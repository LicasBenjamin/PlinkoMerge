extends Panel

func toggle_pause_menu():
	visible = false if visible else true

func return_to_menu():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

func save_and_quit():
	#needs to save the coins, round number, enemy values, later on shop unlocks, and inventory unlocks
	var config = ConfigFile.new()
	config.set_value("player", "coins", Currency.coin)
	pass

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
