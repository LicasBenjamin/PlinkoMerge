extends RigidBody2D

func start_timer(): 
	$Timer.start(10)

#On contact with a peg
func _on_body_entered(body: Node) -> void:
	var speed = linear_velocity.length()
	# Map speed to pitch
	var pitch = clamp(remap(speed, 0, 500, 0.5, 1), 0.5, 1)
	# Map speed to volume (in dB)
	var volume = clamp(remap(speed, 0, 500, -20, -10), -20, -10)
	$AudioStreamPlayer2D.pitch_scale = pitch
	$AudioStreamPlayer2D.volume_db = volume
	$AudioStreamPlayer2D.play()
	
	#$AudioStreamPlayer2D.pitch_scale = randf_range(0.7, 1.1)
	#$AudioStreamPlayer2D.play()
