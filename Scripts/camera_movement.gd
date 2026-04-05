extends Camera2D

@export var shop_button : Button

func _button_pressed():
	if(shop_button.text == "Shop"):
		_go_to_shop()
	else:
		_exit_shop()

func _go_to_shop():
	$AnimationPlayer.play("move_to_shop")
	shop_button.text = "Return"

func _exit_shop():
	$AnimationPlayer.play_backwards("move_to_shop")
	shop_button.text = "Shop"
