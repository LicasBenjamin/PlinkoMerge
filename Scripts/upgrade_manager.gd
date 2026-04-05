extends Node

@export var plinko_machine : Node2D
@export var inventory : Panel
@export var purchaseable_coin_1 : ItemData
@export var coin_drop_button : Button
var award_areas : Array[Area2D]

func _ready() -> void:
	for award_area in plinko_machine.get_children():
		if award_area.has_signal("update_ui"):
			award_areas.append(award_area)
			#print(award_area.rewardType)
	

func upgrade_occurred(upgrade_id : String):
	match upgrade_id:
		"Increase Inventory Space":
			inventory._upgrade_slot_num()
		"Purchase a Coin":
			#print("coin is purchased!")
			inventory.add_item(purchaseable_coin_1)
		"Reduce coin drop button cooldown":
			coin_drop_button.cooldown_time -= 0.2
		"Silver Coin Upgrade 1":
			award_areas[0].rewardType = 1
			award_areas[0].adjust_label()
		"Silver Coin Upgrade 2":
			award_areas[8].rewardType = 1
			award_areas[8].adjust_label()
		"Silver Coin Upgrade 3":
			award_areas[1].rewardType = 1
			award_areas[1].adjust_label()
		"Silver Coin Upgrade 4":
			award_areas[7].rewardType = 1
			award_areas[7].adjust_label()
		"Silver Coin Upgrade 5":
			award_areas[2].rewardType = 1
			award_areas[2].adjust_label()
		"Silver Coin Upgrade 6":
			award_areas[6].rewardType = 1
			award_areas[6].adjust_label()
		"Gold Coin Upgrade 1":
			award_areas[0].rewardType = 2
			award_areas[0].adjust_label()
		"Gold Coin Upgrade 2":
			award_areas[8].rewardType = 2
			award_areas[8].adjust_label()
		_:
			print("Error, upgrade not found in list")
