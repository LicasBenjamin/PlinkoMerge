extends Panel

@export var pause_button : Button

func _ready() -> void:
	GameManager.notify_loss.connect(on_lost_game)

func on_lost_game():
	visible = true
	pause_button.visible = false

func on_main_menu_button_pressed():
	GameManager.quit_game()
	var config = ConfigFile.new()
	config.set_value("player", "coins", Currency.coin)
	#Saving in the middle of a game resets to before that round
	config.set_value("player", "current_round", GameManager.current_round if GameManager.current_state == GameManager.State.Idle else GameManager.current_round - 1)
	config.set_value("enemy", "enemy_1", GameManager.enemy_1_value)
	config.set_value("enemy", "enemy_2", GameManager.enemy_2_value)
	config.set_value("enemy", "enemy_3", GameManager.enemy_3_value)
	config.save("user://save.cfg")
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
