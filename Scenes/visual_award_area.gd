extends Area2D

func _on_body_entered(body: Node2D) -> void:
	#print(body.name)
	#print("Added "+str(rewardAmount)+" to the score!")
	body.queue_free()
