extends Control

@export var currency_label : RichTextLabel
@export var plinko_machine : Node2D

func _ready() -> void:
	update_coin_display()
	for award_area in plinko_machine.get_children():
		if award_area.has_signal("update_ui"):
			award_area.connect("update_ui", Callable(self, "update_coin_display"))
	Currency.connect("update_ui", Callable(self, "update_coin_display"))

#func update_currency_label():
	#Currency.coins
	#
func update_coin_display():
	var text = ""
	text += "[color=#cd7f32]Bronze: %d[/color] " % Currency.coins["bronze"]
	text += "| [color=#c0c0c0]Silver: %d[/color] " % Currency.coins["silver"]
	text += "| [color=#ffd700]Gold: %d[/color]" % Currency.coins["gold"]
	text += "| Coins: " + str(Currency.coin)
	
	currency_label.bbcode_enabled = true
	currency_label.bbcode_text = text
