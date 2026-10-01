extends Node2D


func on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
	pass

func on_quit_button_pressed():
	get_tree().quit()
