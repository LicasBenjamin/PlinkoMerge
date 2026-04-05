extends Node

var coins ={
	"bronze" : 0,
	"silver" : 0,
	"gold" : 0
}

signal update_ui

func add_coins(amount: Dictionary):
	for key in amount:
		coins[key] += amount[key]
	#print(coins)

func spend_coins(amount: Dictionary):
	if not has_enough_coins(amount):
		return false #should error out or something, just returning false for now
	for key in amount:
		coins[key] -= amount[key]
	#UPDATE UI
	update_ui.emit()

func has_enough_coins(amount: Dictionary) -> bool:
	for key in amount:
		if coins.get(key, 0) < amount[key]:
			return false
	return true
