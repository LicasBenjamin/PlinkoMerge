extends Button

@export var spawner_reference : Node2D
@export var cooldown_time : float
var can_be_used : bool

func _ready() -> void:
	#$Timer.wait_time = cooldown_time
	pass

func _on_pressed() -> void:
	if cooldown_time == 0:
		return
	$Timer.start(cooldown_time)
	disabled = true
	can_be_used = false
	#print("Timer started!")

func _on_timer_timeout() -> void:
	can_be_used = true
	disabled = false #Temporary fix, cannot add the upgrade for now
