extends Node2D

@export var coin : RigidBody2D
@export var inventory : Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$coin_drop_button.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func drop_coin(coin_info : ItemData) -> void:
	var instance = coin.duplicate()
	
	instance.value = coin_info.coin_value
	instance.change_coin_sprite(coin_info.icon)
	
	var offset = Vector2(randf_range(-50, 50), randf_range(-50, 50))
	get_tree().current_scene.add_child(instance)
	instance.global_position = global_position + offset  # world position
	instance.freeze = false
	instance.visible = true
	instance.start_timer()
	var impulse = Vector2(randf_range(-100, 100), randf_range(-200, -100))
	instance.apply_impulse(Vector2.ZERO, impulse)

func _on_drop_coin_button_pressed() -> void:
	#print("Type of object: "+str(inventory.selected_slot.item is ItemData))
	if inventory.selected_slot.item:
		drop_coin(inventory.selected_slot.item)



func _update_coin(value : ItemData):
	#check if value is 0 (means coin cannot be used)
	if not value: #if the coin is null
		#if $coin_drop_button.can_be_used:
		#	$coin_drop_button.disabled = true
		$coin_drop_button.disabled = true
	else:
		#update sprite/coin drop valuehere
		$coin_drop_button.disabled = false
		#update coin value here (sprite, value, etc.)
		#print(value)
		coin.value = value.coin_value
		coin.change_coin_sprite(value.icon)
