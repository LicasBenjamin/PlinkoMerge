extends PanelContainer

@export var upgrade: Upgrade
@export var upgrade_list : VBoxContainer
@export var upgrade_manager : Node

@export var inventory : Panel

@export var purchase_sound : AudioStream
@export var cannot_purchase_sound : AudioStream

func _ready():
	$text_margins/text/name.text = upgrade.upgrade_name
	$text_margins/text/description.text = upgrade.upgrade_description
	$text_margins/text/price.text = "Price: "+format_cost(upgrade.cost, upgrade.c_cost)
	

func format_cost(coins: Dictionary, c_coin : int) -> String:
	return str(c_coin)
	
	var parts: Array[String] = []
	if coins["gold"] > 0:
		parts.append("%d Gold" % coins["gold"])
	if coins["silver"] > 0:
		parts.append("%d Silver" % coins["silver"])
	if coins["bronze"] > 0:
		parts.append("%d Bronze" % coins["bronze"])
	return ", ".join(parts)

func _on_buy_pressed():
	if !Currency.has_enough_coins(upgrade.cost, upgrade.c_cost):
		#$AudioStreamPlayer2D.stream = cannot_purchase_sound
		#$AudioStreamPlayer2D.play()
		inventory.sound_player.stream = cannot_purchase_sound
		inventory.sound_player.play()
		return
	#if the purchase is infinitely purchasable, check if there's room in the inventory
	if upgrade.uses == 0:
		if not inventory.has_room_for_items():
			#$AudioStreamPlayer2D.stream = cannot_purchase_sound
			#$AudioStreamPlayer2D.play()
			inventory.sound_player.stream = cannot_purchase_sound
			inventory.sound_player.play()
			return
	Currency.spend_coins(upgrade.cost, upgrade.c_cost)
	print("Bought Upgrade")
	#$AudioStreamPlayer2D.stream = purchase_sound
	#$AudioStreamPlayer2D.play()
	inventory.sound_player.stream = purchase_sound
	inventory.sound_player.play()
	_adjust_after_purchase()

func _adjust_after_purchase():
	upgrade_manager.upgrade_occurred(upgrade.upgrade_name) #apply upgrade
	upgrade.uses-=1
	if(upgrade.uses == 0):
		#add all upgrades to be unlocked before deleting self
		for new_unlock in upgrade.unlocks:
			var slot_scene = preload("res://Scenes/shop_slot.tscn")
			var slot_instance = slot_scene.instantiate()
			slot_instance.upgrade = new_unlock
			slot_instance.upgrade_list = upgrade_list
			slot_instance.upgrade_manager = upgrade_manager
			slot_instance.inventory = inventory
			upgrade_list.add_child(slot_instance)
		#upgrade_manager.upgrade_occurred(upgrade.upgrade_name)
		self.queue_free()
	elif upgrade.uses == -1:#upgrade is infinitely purchaseable, scale upgrade upward accordingly
		#The only upgrade that should be infinitely purchasable should go up 3x
		#if the currency goes over 1k and it's not gold, 
		upgrade.cost = scale_cost(upgrade.cost, 1.3)
		upgrade.c_cost = scale_c_cost(upgrade.c_cost, 1.3)
		$text_margins/text/price.text = "Price: "+format_cost(upgrade.cost, upgrade.c_cost)
		upgrade.uses+=1 #cancels out the adjustment at the start
	else:
		#adjust price
		upgrade.cost_progression_index+=1
		upgrade.cost = upgrade.cost_progression[upgrade.cost_progression_index]
		upgrade.c_cost = upgrade.c_cost_progresison[upgrade.cost_progression_index]
		$text_margins/text/price.text = "Price: "+format_cost(upgrade.cost, upgrade.c_cost)

#Following 3 functions below are for scaling the coins upwards
func scale_cost(coins: Dictionary, multiplier: float) -> Dictionary:
	var total = to_bronze(coins)
	#print(total)
	total *= multiplier
	return from_bronze(total)

func scale_c_cost(coin : int, multiplier : float) -> int:
	return coin * multiplier

func from_bronze(total_bronze: int) -> Dictionary:
	var result = {
		"bronze": 0,
		"silver": 0,
		"gold": 0
	}
	var bronze_per_gold = BRONZE_PER_SILVER * SILVER_PER_GOLD
	
	# Gold
	result["gold"] = total_bronze / bronze_per_gold
	total_bronze = total_bronze % bronze_per_gold
	
	# Silver
	result["silver"] = total_bronze / BRONZE_PER_SILVER
	total_bronze = total_bronze % BRONZE_PER_SILVER
	
	# Bronze
	result["bronze"] = total_bronze
	
	return result

const BRONZE_PER_SILVER = 900
const SILVER_PER_GOLD = 900
func to_bronze(coins: Dictionary) -> float:
	return coins["bronze"] \
		+ coins["silver"] * BRONZE_PER_SILVER \
		+ coins["gold"] * BRONZE_PER_SILVER * SILVER_PER_GOLD
