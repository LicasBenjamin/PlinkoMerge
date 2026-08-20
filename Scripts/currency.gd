extends Node

var coins ={
	"bronze" : 0,
	"silver" : 0,
	"gold" : 0
}

var coin = 0

signal update_ui

func add_coins(amount: Dictionary, c_amount: int):
	for key in amount:
		coins[key] += amount[key]
	#print(coins)

func add_c_coins(amount: int):
	coin += amount

func spend_coins(amount: Dictionary, c_amount : int):
	if not has_enough_coins(amount, c_amount):
		return false #should error out or something, just returning false for now
	for key in amount:
		coins[key] -= amount[key]
	#UPDATE UI
	coin -= c_amount
	update_ui.emit()

func has_enough_coins(amount: Dictionary, c_amount: int) -> bool:
	if coin < c_amount:
		return false
	#for key in amount:
	#	if coins.get(key, 0) < amount[key]:
	#		enough = false
	return true
