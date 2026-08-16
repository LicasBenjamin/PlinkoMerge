extends Panel

@export var pickup_sound : AudioStream
@export var drop_sound : AudioStream

@export var item_slots : Array[Panel]
var selected_slot: Node = null

@export var sound_player : AudioStreamPlayer2D #access to stream player for shop slots

signal update_coin(ItemData)

func _ready():
	GameManager.round_started.connect(_deselect_selected_slot)

func _process(delta: float) -> void:
	if Input.get_current_cursor_shape() == CURSOR_FORBIDDEN:
		DisplayServer.cursor_set_shape(DisplayServer.CURSOR_ARROW)

func play_sound(stream: AudioStream):
	var player = AudioStreamPlayer2D.new()
	add_child(player)
	
	player.stream = stream
	player.play()
	
	# Optional polish
	player.pitch_scale = randf_range(0.95, 1.05)
	
	player.finished.connect(func(): player.queue_free())

var data_bk
func _notification(what: int) -> void:
	if what == Node.NOTIFICATION_DRAG_BEGIN:
		data_bk = get_viewport().gui_get_drag_data()
		#$AudioStreamPlayer2D.stream = pickup_sound
		#$AudioStreamPlayer2D.play()
		play_sound(pickup_sound)
	if what == Node.NOTIFICATION_DRAG_END:
		if not is_drag_successful():
			if data_bk:
				data_bk.icon.show()
				data_bk = null
		#$AudioStreamPlayer2D.stream = drop_sound
		#$AudioStreamPlayer2D.play()
		play_sound(drop_sound)

func _on_slot_clicked(slot: Panel):
	if slot == selected_slot:
		return
	if selected_slot:
		selected_slot.set_selected(false)
	selected_slot = slot
	selected_slot.set_selected(true)
	if(!slot.item):
		update_coin.emit(null)
	else:
		update_coin.emit(slot.item)

#if the item moved is moved at all, then deselect the selected slot
func _item_moved(slot: Panel):
	#print("comparing " +str(slot)+" with "+str(selected_slot))
	_deselect_selected_slot()
	

func _deselect_selected_slot():
	if selected_slot:
		selected_slot.set_selected(false)
		selected_slot = null
		update_coin.emit(null)

func _upgrade_slot_num():
	print("inventory upgrade called")
	for slot in item_slots:
		if not slot.is_active:
			slot.is_active = true
			slot.update_ui()
			return

func has_room_for_items() -> bool:
	for slot in item_slots:
		#print("Finding if slot "+str(slot)+" is valid: "+str(slot.is_active and not slot.item))
		if slot.is_active and not slot.item:
			return true
	return false

func add_item(item : ItemData):
	for slot in item_slots:
		print("Finding if slot "+str(slot)+" can add item: "+str(slot.is_active and not slot.item))
		if slot.is_active and not slot.item:
			slot.item = item
			slot.update_ui()
			return
	#shouldn't hit here, printing error if it occurs
	print("Error, couldn't add an item to inventory")
