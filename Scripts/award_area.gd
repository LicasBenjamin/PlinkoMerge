extends Area2D 

@export var rewardType : int #0 = bronze, 1 = silver, 2 = gold
@export var rewardAmount : int #may be upgradable to increase currency gained per ball
var score : int

@export var bronzeLabel : StyleBoxFlat
@export var silverLabel : StyleBoxFlat
@export var goldLabel : StyleBoxFlat

signal update_ui

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	adjust_label()
	adjust_text()

func adjust_label():
	if rewardType == 0:
		$Panel.add_theme_stylebox_override("panel", bronzeLabel)
	elif rewardType == 1:
		$Panel.add_theme_stylebox_override("panel", silverLabel)
	elif rewardType == 2:
		$Panel.add_theme_stylebox_override("panel", goldLabel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#When a ball hits the reward layer of the peg
func _on_body_entered(body: Node2D) -> void:
	#print(body.name)
	#print("Added "+str(rewardAmount)+" to the score!")
	body.queue_free()
	
	score+=1
	#$RichTextLabel.text = str(score)
	adjust_text()
	$Panel/AnimationPlayer.stop()
	$Panel/AnimationPlayer.play("activated")
	_adjust_currency(rewardType, rewardAmount*body.value)

#func adjust_panel_color():
	#if rewardType == 0:
		#$Panel.add_theme_color_override("B")
	#elif rewardType == 1:
		#$RichTextLabel.text = "[color=#c0c0c0]%d[/color]" % score
	#elif rewardType == 2:
		#$RichTextLabel.text = "[color=#ffd700]%d[/color]" % score

func adjust_text():
	if rewardType == 0:
		$RichTextLabel.text = "[color=#cd7f32]%d[/color]" % score
	elif rewardType == 1:
		$RichTextLabel.text = "[color=#c0c0c0]%d[/color]" % score
	elif rewardType == 2:
		$RichTextLabel.text = "[color=#ffd700]%d[/color]" % score

func _adjust_currency(type: int, amount: int):
	if rewardType == 0:
		Currency.add_coins({"bronze" : amount}, amount)
	elif rewardType == 1:
		Currency.add_coins({"silver" : amount}, amount)
	elif rewardType == 2:
		Currency.add_coins({"gold" : amount}, amount)
	update_ui.emit()
	GameManager.add_score(amount)
