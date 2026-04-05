extends RigidBody2D
class_name Coin

@export var value = 1
#@export var coin_sprite = Texture2D

#func _ready() -> void:
	#if value == -1:
		#$Timer.disconnect("timeout", Callable(self, "coin_timeout"))

#func _process(delta: float) -> void:
	#if linear_velocity.length() == 0:
		#apply_force(Vector2(5, 0))
		#print("applying force")

#Needed in case a coin gets stuck
func start_timer(): 
	$Timer.start(10)
	#print("TIMER STARTED")

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

func change_coin_sprite(new_sprite : Texture2D):
	$coin_sprite.texture = new_sprite

func coin_timeout():
	self.queue_free()
