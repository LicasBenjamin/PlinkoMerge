extends Node2D

@export var coin : RigidBody2D

func drop_coin() -> void:
	var instance = coin.duplicate()
	
	#instance.change_coin_sprite(coin_info.icon)
	
	var offset = Vector2(randf_range(-50, 50), randf_range(-50, 50))
	get_tree().current_scene.add_child(instance)
	instance.global_position = global_position + offset  # world position
	instance.freeze = false
	instance.visible = true
	instance.start_timer()
	var impulse = Vector2(randf_range(-100, 100), randf_range(-200, -100))
	instance.apply_impulse(Vector2.ZERO, impulse)
	
	$Timer.wait_time = randf()
