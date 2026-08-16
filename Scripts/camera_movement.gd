extends Camera2D

@export var shop_button : Button
@export var next_round_button : Button

func _ready():
	GameManager.round_ended.connect(on_round_ended)

func _go_to_shop():
	$AnimationPlayer.play("move_to_shop")
	shop_button.text = "Return"

func _exit_shop():
	$AnimationPlayer.play_backwards("move_to_shop")
	shop_button.text = "Shop"


func shop_button_pressed():
	if(shop_button.text == "Shop"):
		_go_to_shop()
	else:
		_exit_shop()


func select_button_pressed():
	GameManager.start_round()
	shop_button.disabled = true
	next_round_button.visible = false
	$AnimationPlayer.play_backwards("move_to_select")

func on_round_ended():
	shop_button.disabled = false
	next_round_button.disabled = false
	next_round_button.visible = true


func next_round_button_pressed():
	$AnimationPlayer.play("move_to_select")
	next_round_button.disabled = true
