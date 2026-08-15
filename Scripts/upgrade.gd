class_name Upgrade
extends Resource

@export var upgrade_name : String
@export var upgrade_description : String
@export var cost : Dictionary
@export var cost_progression : Array[Dictionary]
var cost_progression_index := 0
@export var unlocks : Array[Upgrade]
@export var uses : int
